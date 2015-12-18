def ulen(li):
    return len(set(li))


def set_style():
    import seaborn as sns
    sns.set_style("whitegrid")
    sns.set_context("poster")
    set_japanese_font()


def set_japanese_font():
    import matplotlib as __matplotlib
    font_path = '/Library/Fonts/Osaka.ttf'
    font_prop = __matplotlib.font_manager.FontProperties(fname=font_path)
    __matplotlib.rcParams['font.family'] = font_prop.get_name()
    __matplotlib.rcParams['pdf.fonttype'] = 42
    __matplotlib.rcParams['savefig.dpi'] = 200
    __matplotlib.rcParams['mathtext.default'] = 'regular'


def import_ds():
    global pd, np, plt, sns, zimpala, zhive
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt
    import seaborn as sns
    import zutil.impala as zimpala
    import zutil.hive as zhive


def nanargsort(a, axis=-1, kind='quicksort', order=None):
    """Returns the indices that would sort an array.

    Perform an indirect sort along the given axis using the algorithm specified
    by the `kind` keyword. It returns an array of indices of the same shape as
    `a` that index data along the given axis in sorted order.

    Parameters
    ----------
    a : array_like
        Array to sort.
    axis : int or None, optional
        Axis along which to sort.  The default is -1 (the last axis). If None,
        the flattened array is used.
    kind : {'quicksort', 'mergesort', 'heapsort'}, optional
        Sorting algorithm.
    order : list, optional
        When `a` is an array with fields defined, this argument specifies
        which fields to compare first, second, etc.  Not all fields need be
        specified.

    Returns
    -------
    index_array : ndarray, int
        Array of indices that sort `a` along the specified axis.
        In other words, ``a[index_array]`` yields a sorted `a`.

    See Also
    --------
    sort : Describes sorting algorithms used.
    lexsort : Indirect stable sort with multiple keys.
    ndarray.sort : Inplace sort.
    argpartition : Indirect partial sort.

    Notes
    -----
    See `sort` for notes on the different sorting algorithms.

    As of NumPy 1.4.0 `argsort` works with real/complex arrays containing
    nan values. The enhanced sort order is documented in `sort`.

    Examples
    --------
    One dimensional array:

    >>> x = np.array([3, 1, 2])
    >>> np.argsort(x)
    array([1, 2, 0])

    Two-dimensional array:

    >>> x = np.array([[0, 3], [2, 2]])
    >>> x
    array([[0, 3],
           [2, 2]])

    >>> np.argsort(x, axis=0)
    array([[0, 1],
           [1, 0]])

    >>> np.argsort(x, axis=1)
    array([[0, 1],
           [0, 1]])

    Sorting with keys:

    >>> x = np.array([(1, 0), (0, 1)], dtype=[('x', '<i4'), ('y', '<i4')])
    >>> x
    array([(1, 0), (0, 1)],
          dtype=[('x', '<i4'), ('y', '<i4')])

    >>> np.argsort(x, order=('x','y'))
    array([1, 0])

    >>> np.argsort(x, order=('y','x'))
    array([0, 1])
    """
    import numpy as np

    if np.any(np.isnan(a)):
        raise Exception("The matrix contains NaN value")
    else:
        return np.argsort(a, axis, kind, order)
