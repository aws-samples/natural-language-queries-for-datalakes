import pandas as pd
import io

def compare_dataframes(expected, generated):
    # Check if expected is empty
    if expected.empty:
        return "EXPECTED SQL RETURNED NO DATA"
    
    # Check if generated is empty when expected is not
    if generated.empty:
        return "GENERATED SQL RETURNED NO DATA"
    
    # Check for missing columns
    missing_columns = set(expected.columns) - set(generated.columns)
    if missing_columns:
        return "MISSING COLUMNS"
    
    # Check for extra columns in generated
    extra_columns_flag = len(generated.columns) > len(expected.columns)
    
    # Align columns and remove extra columns
    common_columns = list(set(expected.columns.tolist()).intersection(set(generated.columns.tolist())))
    expected_aligned = expected[common_columns]
    generated_aligned = generated[common_columns]
    
    # Check for exact match
    if expected_aligned.equals(generated_aligned):
        return "MATCH WITH EXTRA COLUMNS" if extra_columns_flag else "MATCH"
    
    # Try sorting and check again
    expected_sorted = expected_aligned.sort_values(by=list(expected_aligned.columns)).reset_index(drop=True)
    generated_sorted = generated_aligned.sort_values(by=list(generated_aligned.columns)).reset_index(drop=True)
    
    if expected_sorted.equals(generated_sorted):
        return "MATCH EXCEPT SORT ORDER WITH EXTRA COLUMNS" if extra_columns_flag else "MATCH EXCEPT SORT ORDER"
    
    # If all checks fail, return NO MATCH
    return "NO MATCH"

RESULT = """
Name|AvgPrice
Alternative|0.99
Alternative & Punk|0.99
Blues|0.99
Bossa Nova|0.99
Classical|0.9900000000000001
Comedy|1.99
Drama|1.99
Easy Listening|0.9899999999999999
Electronica/Dance|0.99
Heavy Metal|0.99
"""

EXPECTED = """
Name|AvgPrice
Rock|0.99
Jazz|0.9899999999999999
Metal|0.99
Alternative & Punk|0.99
Rock And Roll|0.9899999999999999
Blues|0.99
Latin|0.9900000000000001
Reggae|0.99
Pop|0.9899999999999999
Soundtrack|0.99
"""

RESULT = """
Name|AvgPrice
Metal|0.99
Jazz|0.9899999999999999
Rock|0.99
"""

EXPECTED = """
Name|AvgPrice
Rock|0.99
Jazz|0.9899999999999999
Metal|0.99
"""

RESULT = """
Name|AvgPrice
Jazz|0.9899999999999999
Metal|0.99
Rock|0.99
"""

EXPECTED = """
Name|AvgPrice
Jazz|0.9899999999999999
Metal|0.99
Rock|0.99
"""

RESULT = """
Name|AvgPrice
Jazz|0.9899999999999999
Metal|0.99
Rock|0.99
"""

EXPECTED = """
Name|AvgPrice|First
Jazz|0.9899999999999999|something
Metal|0.99|else
Rock|0.99|entirely
"""


RESULT = """
Name|AvgPrice|First
Jazz|0.9899999999999999|something
Metal|0.99|else
Rock|0.99|entirely
"""

EXPECTED = """
Name|AvgPrice
Jazz|0.9899999999999999
Metal|0.99
Rock|0.99
"""

RESULT = """
Name|AvgPrice|First
Jazz|0.9899999999999999|something
Metal|0.99|else
Rock|0.99|entirely
"""

EXPECTED = """
Name|AvgPrice
Metal|0.99
Rock|0.99
Jazz|0.9899999999999999
"""

def compare_csvs(expected_csv, result_csv, delimiter):
    expected_df = pd.read_csv(io.StringIO(expected_csv), sep=delimiter, skipinitialspace=True)
    result_df = pd.read_csv(io.StringIO(result_csv), sep=delimiter, skipinitialspace=True)
    return compare_dataframes(expected_df, result_df)

result_csv_file = io.StringIO(RESULT)
result_df = pd.read_csv(result_csv_file, sep='|', skipinitialspace=True)
expected_csv_file = io.StringIO(EXPECTED)
expected_df = pd.read_csv(expected_csv_file, sep='|', skipinitialspace=True)
print(compare_dataframes(expected_df, result_df))
