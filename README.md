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
without_src_folder/  # This will be ignored
  |- other_lambda_function.py  # src/ does not exist here
  |- requirements.txt
__with_double_underscores/  # This will also be ignored
  |- src/
  |   |- main.py
  |- requirements.txt


# to build

> sh ./build.sh

```
