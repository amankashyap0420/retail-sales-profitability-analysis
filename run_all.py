"""Execute every notebook with fresh kernels, saving real outputs."""
from pathlib import Path
import nbformat
from nbclient import NotebookClient
ROOT=Path(__file__).resolve().parent
for path in sorted((ROOT/'notebooks').glob('*.ipynb')):
    print('Running',path.name,flush=True)
    nb=nbformat.read(path,as_version=4)
    NotebookClient(nb,timeout=300,kernel_name='python3',resources={'metadata':{'path':str(ROOT/'notebooks')}}).execute()
    nbformat.write(nb,path)
print('Complete: notebooks, tables, charts, SQL database and Power BI CSVs refreshed.')
