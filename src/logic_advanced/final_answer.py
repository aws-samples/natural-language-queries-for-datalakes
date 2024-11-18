from utils.bcolors import Bcolors
from config import dgConfig

class FinalAnswer():
    
    def __init__(self, language_model):
        self.language_model = language_model
        
    def _format_output(self, s):
        """
        Format output to be displayed in the chat window
        """
        s = s.replace("<response>", "")
        s = s.replace("</response>", "")
        s = s.replace("<answer>", "\n#### Answer to the question\n")
        s = s.replace("</answer>", "")
        s = s.replace("<explanation>", "\n#### Explanation of answer\n")
        s = s.replace("</explanation>", "\n")
        
        return s        
    
    def generate_answer(self, question, sql=None, tables_to_use=None, message_placeholder=None, previous_display=""):
        
        print()
        print("******************* STEP 3 ***********************")
        print("*                                                *")
        print("*            Create final answer                 *")
        print("*                                                *")
        print("**************************************************")
        
        sql_query = sql['sql_query']
        sql_result = sql['sql_result']
        table_info = sql['table_info']
        
        docs_tables = str(tables_to_use['document']) \
                .replace('{', '{{') \
                .replace('}', '}}')
        
        prompt = f"""
         \n\nHuman: We have a performed an SQL query, given between <sqlq></sqlq> tags. We have the result of this SQL query, given between <sqlr></sqlr> tags. Description of the table is given between the <tabledesc></tabledesc> tags. We have a question than we want to answer, between <question></question> tags. Given these information, we want the answer to the question.\n
         We want a comprehensive answer to the question, repeating the data of the sql result if needed in a readable format (markdown), followed by an explanation of the SQL query that has been performed.\n
         <tabledesc>{docs_tables}</tabledesc>\n
         <question>{question}</question>\n
         <sqlq>{sql_query}</sqlq>\n
         <sqlr>{sql_result}</sqlr>\n
         \nPlease put your response between the <response></response> tags, in the following format: <response><answer>answer to the question</answer><explanation>explanation</explanation></response>
         \n\nAssistant:
         """
         
        print("\nPrompt for final answer generation:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)         
         
        header = "### Step 3: Final answer\n"
        
        def concatenate_texts(s):
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(dgConfig.LLM_VERSION_FOR_RESULT_SUMMARY, prompt, callback)
        
        print(Bcolors.OKCYAN + generated_text + Bcolors.ENDC)

        display_text = concatenate_texts(self._format_output(generated_text))

        answer = generated_text.split("<answer>")[1].split("</answer>")[0]
        explanation = generated_text.split("<explanation>")[1].split("</explanation>")[0]
        
        return {
            'answer': answer,
            'explanation': explanation,
            'sql_query': sql_query,
            'table_info': table_info,
            'doc_tables': tables_to_use['document'],
            'display_response': display_text,
        }