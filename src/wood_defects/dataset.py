from datasets import load_dataset
from wood_defects.config import DATASET_NAME



def set_dataset():
    dataset = load_dataset(DATASET_NAME)
    return dataset