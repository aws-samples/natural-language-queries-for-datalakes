#!/bin/bash
echo "STARTING STREAMLIT ON PORT 8080. MAKE SURE YOU HAVE YOUR AWS CREDENTIALS EXPORTED!"
streamlit run streamlit_app.py --server.port 8080
