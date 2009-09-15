#! /bin/bash
#
# Author: Soo Hwan Park
#

ROOT_DIR=~/AppRepository
WEB_ROOT=/var/www

if [ $# -lt 4 ]; then
  echo "usage: ./makegraph.sh test_id database num_agent num_test"
  exit
fi
 
BINDIR=${ROOT_DIR}/bin
TEST_ID=$1
DB=$2
num_agent=$3
num_test=$4

echo $DB

REPOSITORY=${WEB_ROOT}/${TEST_ID}
mkdir -p ${REPOSITORY}
data_dir=${ROOT_DIR}/${TEST_ID}

function makeData {
  cd $data_dir
  ${BINDIR}/AppPlotMulti.py ${data_dir} ${DB} $num_agent data_appscale $num_test
  cp ${data_dir}/*.xls ${REPOSITORY}
  cp ${WEB_ROOT}/index1.php ${REPOSITORY}/index.php
}

function makeChart {
  cd $data_dir
  ${BINDIR}/AppTransactionPlot.py ${data_dir} first > ${REPOSITORY}/${DB}_transaction1.png
  ${BINDIR}/AppTransactionPlot.py ${data_dir} all > ${REPOSITORY}/${DB}_transaction.png
  ${BINDIR}/AppTransactionPlot.py ${data_dir} first eps
  ${BINDIR}/AppTransactionPlot.py ${data_dir} all eps

  ${BINDIR}/AppResponsePlot.py ${data_dir} all > ${REPOSITORY}/${DB}_response.png
  ${BINDIR}/AppResponsePlot.py ${data_dir} first > ${REPOSITORY}/${DB}_response1.png
  ${BINDIR}/AppResponsePlot.py ${data_dir} all eps
  ${BINDIR}/AppResponsePlot.py ${data_dir} first eps
  mv ${data_dir}/*.eps ${REPOSITORY}/
}

makeData
makeChart

cd ${ROOT_DIR}
