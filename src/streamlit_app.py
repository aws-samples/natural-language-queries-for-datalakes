import streamlit as st
from utils.auth import Auth
from config_stack import Config
from config import dgConfig

if dgConfig.ENABLE_ADVANCED_MODE:
	from logic_advanced.datagenie import DataGenie
else:
	from logic.datagenie import DataGenie

# Perform auth and stop if not authenticated
# Also display sidebar
if dgConfig.ENABLE_AUTH == True:
    Auth.perform_auth(st, Config.SECRETS_MANAGER_ID)

# Perform auth and stop if not authenticated
# Also display sidebar
#Auth.perform_auth(st, Config.SECRETS_MANAGER_ID)

st.title("DataGenie")

# Index catalog button
index_catalog_button = st.button("Index Business Data Catalog")

# Use DataGenie
dg = DataGenie()

# If button pressed
if index_catalog_button:
    # Index the business data catalog
    dg.index_catalog()

    st.write('Indexing complete!')
    
st.divider()

# Initialize chat history
if "messages" not in st.session_state:
    st.session_state.messages = []

col1, col2, col3 = st.columns(3)

with col3:
    clear_chat_button = st.button("Clear output")

# Reset history when new conversation button is clicked
if clear_chat_button:
    st.session_state.messages = []
    dg.reset_chat()
    st.rerun()

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

# React to user input
if prompt := st.chat_input("Ask your question"):
    # Display user message in chat message container
    with st.chat_message("user"):
        st.markdown(prompt)
    # Add user message to chat history
    st.session_state.messages.append({"role": "user", "content": prompt})

    # Display assistant response in chat message container
    with st.chat_message("assistant"):
        message_placeholder = st.empty()
        full_response = ""
        dg_answer = dg.answer(prompt, message_placeholder=message_placeholder)
        response = dg_answer["response"]
        message_placeholder.markdown(response['display_response'])
    
    # Add assistant response to chat history
    st.session_state.messages.append({"role": "assistant", "content": response})
