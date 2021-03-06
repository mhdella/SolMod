\name{Reindl}
\alias{Reindl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Reindl transposition model
}
\description{
Reindl's transposition model (Reindl et al., 1990)
}
\usage{
Reindl(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{A \code{data.frame} containing the tilt angle \eqn{s}, zenith angle \eqn{z}, incidence angle \eqn{\theta}, GHI \eqn{G_h}, DHI \eqn{D_h} and extraterrestrial GHI \eqn{I_{oh}}.}
}
\details{
Reindl model (Reindl et al., 1990) is developed based on \link{Hay1} and \link{Klucher}.
}
\value{
Returns the diffuse transposition factor \eqn{R_d}.
}
\references{
D.T. Reindl, W.A. Beckman, J.A. Duffie, Evaluation of hourly tilted surface radiation models, \emph{Solar Energy}, Volume 45, Issue 1, 1990, Pages 9-17, ISSN 0038-092X, \url{http://dx.doi.org/10.1016/0038-092X(90)90061-G}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Hay1}, \link{Klucher}, \link{NREL}}
}
\examples{
data("NREL")
NREL$theta = NREL$theta1
NREL$s = 40
Rd <- Reindl(NREL)

#calculate Gc and plot
Ic <- cos(d2r(NREL$theta))/cos(d2r(NREL$Z))*(NREL$Gh-NREL$Dh)
Dg <- NREL$Gh*0.5*NREL$rho*(1-cos(d2r(NREL$s)))
Dc <- Rd*NREL$Dh
Gc <- Ic + Dg + Dc

plot(NREL$Gc1, Gc, pch = ".") #measured versus predicted
abline(0,1,col=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Transposition}
\keyword{2nd generation}

