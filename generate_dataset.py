# here is a base schema of requested data
"""
table_name = user_post_view
post_id: int (primary key) reference to post_id in posts table, but joins will not be used for now
user_id: int (primary key) reference to user_id in users table, but joins will not be used for now
"""

# request purpose: to get all posts already seen by user with specific user id

# generating CSV dataset for Clickhouse and PostgreSQL to insert

import csv
import random

from env import DATASET_FILE_NAME


def generate_dataset(data_range=1000000):
    # generating dataset
    with open(DATASET_FILE_NAME, 'w', newline='') as csvfile:
        fieldnames = ['post_id', 'user_id']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for i in range(data_range):
            writer.writerow({'post_id': random.randint(1, 1000000), 'user_id': random.randint(1, 100)})


if __name__ == '__main__':
    # this is about 15 MB of data
    generate_dataset(data_range=1000000)
