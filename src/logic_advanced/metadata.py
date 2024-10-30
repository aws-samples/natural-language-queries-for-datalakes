import os
from config import dgConfig

class Metadata():
	def __init__(self):
		pass

	def get_table_ddl(self, database, tables, asXML=True, verbose=False):
		# Get table info from the database (schema and sample rows)
		table_info = []
		for table in set(tables):
			ddl_file = f"{dgConfig.SQLITE_DATABASES_DIR}/DDL-annotated/{database}.{table}.sql"
			try:
				with open(ddl_file, 'r') as f:
					table_ddl = f.read()
					table_prefix = f'<TABLE_DESCRIPTION NAME="{table}">\n' if asXML else ""
					table_suffix = f'\n</TABLE_DESCRIPTION>\n' if asXML else ""
					table_info.append(f'{table_prefix}{table_ddl}{table_suffix}')
					print(f"Added table DDL for table {table} under database {database}")
			except:
				print(f"No table DDL found for table {table} under database {database}")

		all_table_ddl = "\n\n".join(table_info)
		return all_table_ddl
