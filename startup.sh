#!/bin/bash
source /etc/bash.bashrc
mlflow server --backend-store-uri sqlite:///mlflow.db --default-artifact-root ./artifacts --host 0.0.0.0 &
jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root