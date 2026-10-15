"""Naive pandas load of user_logs.csv, run on purpose to find where it breaks.
See docs/where-pandas-broke.md."""

import resource
import sys
import time

import pandas as pd

PATH = "data/csv/user_logs.csv"

print(f"python {sys.version.split()[0]}, pandas {pd.__version__}", flush=True)
t0 = time.perf_counter()
df = pd.read_csv(PATH)  # the naive call: no dtypes, no chunks
elapsed = time.perf_counter() - t0
peak_mb = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / 1024
print(
    f"loaded {len(df):,} rows in {elapsed:.0f}s, peak RSS {peak_mb:,.0f} MB", flush=True
)
print(f"DataFrame size: {df.memory_usage(deep=True).sum() / 1e9:.1f} GB", flush=True)
