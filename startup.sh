#!/bin/bash
source /etc/bash.bashrc
mlflow server --backend-store-uri sqlite:///mlflow.db --default-artifact-root ./artifacts --file-store ./mlruns --host 0.0.0.0 &
jupyter lab --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root