context("Test distribution plots for given results/junction")

test_that("Main junction distribution plot", {
    # get results
    fds <- getFraser()
    res <- results(fds, padjCutoff=1, zScoreCutoff=NA, deltaPsiCutoff=NA)

    # plot distributions
    expect_silent(plotExpression(fds, result=res[1]))
    expect_silent(plotVolcano(fds, "sample1", "psi5"))
    expect_silent(plotExpectedVsObservedPsi(fds, result=res[2]))
    
    expect_is(plotCountCorHeatmap(fds, "psi5", norm=FALSE), "pheatmap")
    expect_is(plotCountCorHeatmap(fds, "psi5", norm=TRUE), "pheatmap")
    expect_is(plotCountCorHeatmap(fds, "psi5", norm=TRUE, topN=10), "pheatmap")
})

