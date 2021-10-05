if [[ $(uname) == "Linux" ]]; then
    cd ${SRC_DIR}/build/linux/release
fi

if [[ $(uname) == "Darwin" ]]; then
    cd ${SRC_DIR}/build/mac/release
fi

export GPP=${CXX}
export PREFIX=${PREFIX}

cp ${RECIPE_DIR}/Makefile Makefile
cp ${RECIPE_DIR}/makefile_common ../..
cp ${RECIPE_DIR}/__init__.py ../../python/vina
cp ${RECIPE_DIR}/setup.py ../../python/

make

cp vina ${PREFIX}/bin
cp vina_split ${PREFIX}/bin

cd ${SRC_DIR}/build/python
python setup.py build install
