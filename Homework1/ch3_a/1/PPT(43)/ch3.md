## $E(X)$

$E(X)=\int^\infty_{-\infty}xf(x)dx$

$=\int^\infty_{-\infty}(x-\mu)f(x)dx+\int^\infty_{-\infty}\mu f(x)dx$

令  $t=x-\mu$

$=\int^\infty_{-\infty}tf(t+\mu)dt+\mu\int^\infty_{-\infty}f(x)dx$

$=\frac{1}{\sqrt{2\pi}\sigma}\int^\infty_{-\infty}te^{\frac{-t^2}{2\sigma^2}}dt+\mu$

$=0+\mu=\mu$



## $D(X)$

$E(X^2)=\int^\infty_{-\infty}x^2f(x)dx$

$=\int^\infty_{-\infty}(x-\mu+\mu)^2f(x)dx$

$=\int^\infty_{-\infty}[(x-\mu)^2+\mu^2+2(x-\mu)\mu]f(x)dx$

$=\int^\infty_{-\infty}(x-\mu)^2f(x)dx+\int^\infty_{-\infty}(2x\mu-\mu^2)f(x)dx$

$=\int^\infty_{-\infty}t^2f(t+\mu)dt+\mu^2$

$=\frac{1}{\sqrt{2\pi}\sigma}\int^\infty_{-\infty}t^2e^{\frac{-t^2}{2\sigma^2}}dt+\mu^2$



$\int^\infty_{-\infty}t^2e^{\frac{-t^2}{2\sigma^2}}dt=-\sigma^2\int^\infty_{-\infty}tde^{\frac{-t^2}{2\sigma^2}}$

$=-\sigma^2[te^{\frac{-t^2}{2\sigma^2}}]_{-\infty}^{+\infty}+\sigma^2\int^\infty_{-\infty}e^{\frac{-t^2}{2\sigma^2}}dt$

$=0+\sigma^2\int^\infty_{-\infty}e^{\frac{-t^2}{2\sigma^2}}dt=\sigma^2\int^\infty_{-\infty}e^{\frac{-t^2}{2\sigma^2}}dt$

$E(X^2)=\sigma^2\int^\infty_{-\infty}\frac{1}{\sqrt{2\pi}\sigma}e^{\frac{-t^2}{2\sigma^2}}dt+\mu^2$

$=\sigma^2+\mu^2$



$D(X)=E(X^2)-E^2(X)=\sigma^2$

