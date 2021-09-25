#!/usr/bin/env bash
beginswith() {
    case $2 in "$1"*) true;; *) false;; esac;
}

if [ -d build ]; then
  rm -rf build
fi

# Recreate build directory
mkdir -p build

# Copy source files
for dir in */ ; do
    if beginswith __ "$dir"; then
        echo "skip $dir."
        continue
    fi

    SUBDIR=$dir"*"
    for inside in $SUBDIR ; do
        SUBDIR_SRC=$dir"src"
        if [ "$inside" = "$SUBDIR_SRC" ]; then
            if [ "$dir" != "build/" ]; then
                SOURCE_DIR=${dir}src
                DIST_DIR=${dir}dist

                echo "Copying $dir to dist..."
                mkdir -p build/$DIST_DIR/src
                cp -r $SOURCE_DIR/* build/$DIST_DIR/src

                echo "Packing python libraries for $dir"
                cd $dir
                TARGET_FOLDER="../build/$dir"
                pip install -r requirements.txt -t ${TARGET_FOLDER}dist

                if [ -f "./build.sh" ]; then
                    cp build.sh ../build/$DIST_DIR
                    cd ../build/$DIST_DIR
                    sh ./build.sh && rm ./build.sh
                    cd -
                fi

                cd ../
            fi

            continue
        fi
    done
done

# remove pycaches
find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
