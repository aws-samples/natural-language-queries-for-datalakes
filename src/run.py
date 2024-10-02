from utils.bcolors import Bcolors
from config import dgConfig

# if dgConfig.ENABLE_ADVANCED_MODE:
# 	from logic_advanced.datagenie import DataGenie
# else:
from logic.datagenie import DataGenie

# Use DataGenie
dg = DataGenie()

question = "List 5 products and their supplier name"

dg_answer = dg.answer(question)
answer = dg_answer["response"]

print("******************** RESULT **********************")
print("*                                                *")
print("*                 Final answer                   *")
print("*                                                *")
print("**************************************************")
print()   
print("Your question: ", question)
print
print()
print("Answer to the question: ")
print(Bcolors.OKCYAN + answer['answer'] + Bcolors.ENDC)
print()
print("Explanation: ")
print(Bcolors.OKCYAN + answer['explanation'] + Bcolors.ENDC)