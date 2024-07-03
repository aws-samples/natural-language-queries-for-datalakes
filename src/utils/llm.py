import boto3
from langchain_community.embeddings import BedrockEmbeddings
import json

class LanguageModel():
    
    def __init__(self):

        # Create bedrock client
        bedrock_client = boto3.client(
            'bedrock-runtime',
            region_name='us-west-2'
            )
        self.bedrock_client = bedrock_client

        # Create embeddings model object
        self.embeddings = BedrockEmbeddings(
            client=bedrock_client, 
            model_id="amazon.titan-embed-text-v1"
        )
                    
    def invoke_with_stream_callback(self, prompt, callback):
        """
        Params:
        prompt: prompt to send to LLM
        callback: callback function to call when we get a new completion
        """
        
        body = {
            "messages": [{"role": "user", "content": prompt}],
            "max_tokens": 4000,
            "temperature": 0, 
            "top_p": 0,
            "top_k": 250,
            "anthropic_version":"",
        }
        body = json.dumps(body)
        
        response = self.bedrock_client.invoke_model_with_response_stream(
            body=body,
            modelId="anthropic.claude-3-sonnet-20240229-v1:0",
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

