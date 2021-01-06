import pandas as pd
import os

# parse samples metadata
samples_tbl=config["samples"]
samples_meta=pd.read_csv(samples_tbl, header = None)
samples_meta.columns=["Sample", "Path"]
samples_meta=samples_meta.set_index("Sample", drop = False)

# define helper functions
def assembly_input(wildcards):
  sample=wildcards["sample"]
  if config["trim"] == 0:
    return samples_meta.Path[wildcards.sample]
  else:
    return os.path.join(sample, sample+"_trimmed.fastq")