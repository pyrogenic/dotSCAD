use <util/sorted.scad>;

module test_sorted() {
    echo("==== test_sorted ====");

    assert([1, 2, 3, 4, 5, 6] == sorted([1, 6, 2, 5, 4, 3])
);

    assert(
        [[2, 0, 0], [5, 0, 0], [7, 0, 0], [9, 0, 0], [10, 0, 0]] == 
        sorted([[2, 0, 0], [5, 0, 0], [7, 0, 0], [9, 0, 0], [10, 0, 0]])
    );

    assert(
        [[2, 0, 0], [5, 0, 0], [7, 0, 0], [9, 0, 0], [10, 0, 0]] == 
        sorted([[10, 0, 0], [5, 0, 0], [7, 0, 0], [2, 0, 0], [9, 0, 0]], cmp = function(a, b) a[0] - b[0])
    );

    ascending = function(e1, e2) e1 - e2;
    descending = function(e1, e2) e2 - e1;
    assert(sorted([2, 1, 3, 5, 4], ascending) == [1, 2, 3, 4, 5]);
    assert(sorted([2, 1, 3, 5, 4], descending) == [5, 4, 3, 2, 1]);
}

test_sorted();