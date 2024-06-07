from utils.llm import LanguageModel
from logic.catalog_query import CatalogQuery

# Create the Language model
language_model = LanguageModel()

cq = CatalogQuery(language_model)

# Recreate the index of the catalog
cq.index_catalog()
