from logic.catalog_query import CatalogQuery
from logic.sql_query import SqlQuery
from logic.final_answer import FinalAnswer
from config import dgConfig
from utils.llm import LanguageModel
from utils.database_connectors import DatabaseConnectors

class DataGenie():
    
    def __init__(self):
        # Create bedrock client
        self.language_model = LanguageModel()

        # Database connector
        self.database_connectors = DatabaseConnectors()
        
    
    def answer(self, question, message_placeholder=None):
        """
        Answer a question given an input question
        
        Parameters
        ----------
        question: str
            The question
        
        Returns
        -------
        dict
            success: boolean
            answer: str
        """
        
        cq = CatalogQuery(self.language_model)
        tables_to_use = cq.query_catalog(question, message_placeholder=message_placeholder)
        
        # Get previous response to display
        display_response = tables_to_use['display_response']

        sq = SqlQuery(self.language_model, self.database_connectors)
        sql = sq.generate_sql(question,
            tables_to_use=tables_to_use,
            message_placeholder=message_placeholder,
            previous_display=display_response)
            
        # Get previous response to display
        display_response_2 = sql['display_response']        

        fa = FinalAnswer(self.language_model)
        answer = fa.generate_answer(question,
            sql=sql,
            tables_to_use=tables_to_use,
            message_placeholder=message_placeholder,
            previous_display=display_response_2)

        return {"response": answer, "sql_statement": sql['sql_query'], "table_list": tables_to_use["table"], "database_list": [tables_to_use["database"]]}
    
        
    def index_catalog(self):
        cq = CatalogQuery(self.language_model)
    
        # Recreate the index of the catalog
        cq.index_catalog()


    def reset_chat(self):
        self.chat_history = []
