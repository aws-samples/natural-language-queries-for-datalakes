from utils.llm import LanguageModel
from config import dgConfig

# if dgConfig.ENABLE_ADVANCED_MODE:
# 	from logic_advanced.catalog_query import CatalogQuery
# else:
from logic.catalog_query import CatalogQuery

# Create the Language model
language_model = LanguageModel()

cq = CatalogQuery(language_model)

# Recreate the index of the catalog
cq.index_catalog()
