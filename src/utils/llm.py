import boto3
from langchain_community.embeddings import BedrockEmbeddings
import json
from config import dgConfig

class LanguageModel():
    
    def __init__(self):

        # Create bedrock client
        bedrock_client = boto3.client(
            'bedrock-runtime',
            region_name=dgConfig.AWS_BEDROCK_REGION,
            )
        self.bedrock_client = bedrock_client

        # Create embeddings model object
        self.embeddings = BedrockEmbeddings(
            client=bedrock_client, 
            model_id=dgConfig.VECTOR_EMBEDDING_MODEL
        )


    def invoke_with_stream_callback(self, model, user_prompt, callback, system_prompt=None):
        """
        Params:
        prompt: prompt to send to LLM
        callback: callback function to call when we get a new completion
        """
        
        body = {
            "messages": [{"role": "user", "content": user_prompt}],
            "max_tokens": 4096,
            "temperature": 0, 
            "top_p": 0,
            "top_k": 250,
            "anthropic_version":"",
        }

        if system_prompt:
            body["system"] = system_prompt

        body = json.dumps(body)
        
        response = self.bedrock_client.invoke_model_with_response_stream(
            body=body,
            modelId=model,
            accept='application/json',
            contentType='application/json'
        )
        stream = response.get('body')
        
        s = ""
        if stream:
            for event in stream:
                chunk = event.get('chunk')
                if chunk:
                    chunk_obj = json.loads(chunk.get('bytes').decode())
                    if chunk_obj['type'] == 'content_block_delta':
                        text = chunk_obj['delta']['text']
                    else:
                        text = ""
                    text = text.replace('\n', '  \n')
                    s += text
                    callback(s)

        return s

