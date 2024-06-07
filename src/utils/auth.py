import boto3
import json
from streamlit_cognito_auth import CognitoAuthenticator

class Auth:

    @staticmethod
    def _get_authenticator(secret_id):
        """
        Get Cognito parameters from Secrets Manager and
        returns a CognitoAuthenticator object.
        """
        # Get Cognito parameters from Secrets Manager
        secretsmanager_client = boto3.client("secretsmanager")
        response = secretsmanager_client.get_secret_value(
            SecretId=secret_id,
        )
        secret_string = json.loads(response['SecretString'])
        pool_id = secret_string['pool_id']
        app_client_id = secret_string['app_client_id']
        app_client_secret = secret_string['app_client_secret']

        # Initialise CognitoAuthenticator
        authenticator = CognitoAuthenticator(
            pool_id=pool_id,
            app_client_id=app_client_id,
            app_client_secret=app_client_secret,
        )

        return authenticator
        
    @staticmethod
    def perform_auth(st, secrets_manager_id):
        '''
        Perform authentication and stop the app if not logged in.
        Params:
            st: Streamlit app object.
            secrets_manager_id: AWS Secrets Manager secret ID.
        Returns:
            None.
        '''
        
        # Initialise CognitoAuthenticator
        authenticator = Auth._get_authenticator(secrets_manager_id)
        
        # Authenticate user, and stop here if not logged in
        is_logged_in = authenticator.login()
        
        if not is_logged_in:
            st.stop()
        
        def logout():
            authenticator.logout()
        
        with st.sidebar:
            st.text(f"Welcome,\n{authenticator.get_username()}")
            st.button("Logout", "logout_btn", on_click=logout)

        return is_logged_in
        
