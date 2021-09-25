Lambda build script with pip libraries

```
# folder struct

lambda_function/
  |- src/
  |   |- lambda_function.py
  |- build.sh [optional]
  |- requirements.txt
other_lambda_function/
  |- src/
  |   |- other_lambda_function.py
  |- requirements.txt
no_src_folder/  # This will be ignored
  |- other_lambda_function.py
  |- requirements.txt
__with_double_underscore/  # This will also be ignored
  |- src/
  |   |- main.py
  |- requirements.txt


# to build

> sh ./build.sh

```
