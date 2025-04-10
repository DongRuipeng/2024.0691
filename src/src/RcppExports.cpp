// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// cospa_para
Rcpp::List cospa_para(arma::mat& X, arma::mat& Y, arma::mat& C, unsigned nrank, const unsigned smin, const unsigned smax, double alpha, double tol, unsigned max_iter, bool verbose);
RcppExport SEXP _cospa_cospa_para(SEXP XSEXP, SEXP YSEXP, SEXP CSEXP, SEXP nrankSEXP, SEXP sminSEXP, SEXP smaxSEXP, SEXP alphaSEXP, SEXP tolSEXP, SEXP max_iterSEXP, SEXP verboseSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat& >::type X(XSEXP);
    Rcpp::traits::input_parameter< arma::mat& >::type Y(YSEXP);
    Rcpp::traits::input_parameter< arma::mat& >::type C(CSEXP);
    Rcpp::traits::input_parameter< unsigned >::type nrank(nrankSEXP);
    Rcpp::traits::input_parameter< const unsigned >::type smin(sminSEXP);
    Rcpp::traits::input_parameter< const unsigned >::type smax(smaxSEXP);
    Rcpp::traits::input_parameter< double >::type alpha(alphaSEXP);
    Rcpp::traits::input_parameter< double >::type tol(tolSEXP);
    Rcpp::traits::input_parameter< unsigned >::type max_iter(max_iterSEXP);
    Rcpp::traits::input_parameter< bool >::type verbose(verboseSEXP);
    rcpp_result_gen = Rcpp::wrap(cospa_para(X, Y, C, nrank, smin, smax, alpha, tol, max_iter, verbose));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_cospa_cospa_para", (DL_FUNC) &_cospa_cospa_para, 10},
    {NULL, NULL, 0}
};

RcppExport void R_init_cospa(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
