=============================
Nextflow File Caching Example
=============================

This is a small example workflow that works with resume when run locally, but
resume fails when running on AWS Batch. This may not be unique to that executor,
but it's the one tested with this workflow.

Running locally
---------------

.. code::

    nextflow run main.nf -resume

Note that on a subsequent run, the processes are cached and not re-executed:

.. code::

    nextflow run main.nf -resume
    N E X T F L O W  ~  version 20.10.0
    Launching `main.nf` [insane_leavitt] - revision: 8ce1303172
    [d7/807416] process > foo (1) [100%] 3 of 3, cached: 3 ✔

Running on Batch
----------------

To run on Batch, you will have to specify your configuration as per the
documentation [1]_.

.. [1] https://www.nextflow.io/docs/latest/awscloud.html
