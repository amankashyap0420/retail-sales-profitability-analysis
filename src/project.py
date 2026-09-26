from pathlib import Path
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
ROOT = Path(__file__).resolve().parents[1]
def load():
    path = ROOT / 'data/processed/sales_clean.csv'
    if not path.exists():
        raise FileNotFoundError('Run notebook 01_data_quality first.')
    return pd.read_csv(path, parse_dates=['Order Date','Ship Date'], dtype={'Postal Code':str})
def summarize(df, keys):
    out = df.groupby(keys, observed=True, dropna=False).agg(
        Sales=('Sales','sum'), Profit=('Profit','sum'), Units=('Quantity','sum'),
        Orders=('Order ID','nunique'), Lines=('Row ID','count'))
    out['Margin_pct'] = np.where(out.Sales != 0, 100*out.Profit/out.Sales, np.nan)
    return out.sort_values('Sales',ascending=False)
def save_table(df, name):
    df.to_csv(ROOT / 'reports/tables' / (name+'.csv'))
def chart(name):
    plt.tight_layout()
    plt.savefig(ROOT / 'reports/figures' / (name+'.png'),dpi=160,bbox_inches='tight')
    plt.show()
