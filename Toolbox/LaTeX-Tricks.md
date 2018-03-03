---
layout: post
title: LaTeX Tricks
date: Mar. 3, 2018
author: Yi DING
---

### Sections
``` LaTeX
\section{Introduction}~\label{sec:introduction}
```

### Page Settings

``` LaTeX
% New Page
\newpage
```

### Paragraph
``` LaTeX
% Indent settings
\noindent

% Vertical space
\vspace{0.1in}

% Item
\noindent $\bullet$ \; $\bullet$
```

### Figures
``` LaTeX
\begin{figure}
\includegraphics[scale=0.6]{filename}
\caption{captions}
\label{reflabel}
\vspace{-0.15in}
\end{figure}
```

### Tables
``` LaTeX
% A simple Table
\begin{table}
\caption{Amazon Shipping Service\label{amazon}}
\begin{tabular}{|c|c|c|} \hline
Shipping Service & Time guarantee & Shipping Rate \\ \hline
One-Day Shipping & 1 day & \$18.98 \\ \hline
Two-Day Shipping & 2 days & \$9.98 \\ \hline
Standard Shipping & 4$\sim$5 days & \$4.98  \\ \hline
\end{tabular}
\end{table}

% Table with multiple row/columns
\begin{table}%
\tbl{table name}
\caption{table caption \label{table_label}}
\begin{tabular}{|c|c|c|c|c|} \hline
\multicolumn{2}{|c|}{\multirow{2}{*}{content}}}
 & \multicolumn{3}{|c|}{To} \\ \cline{3-5}
\multicolumn{2}{|c|}{}   & CEC & GT & CC \\ \cline{1-5}
\multirow{3}{*}{From} & CEC & - & 58 & 9 \\ \cline{2-5}
\multirow{3}{*}{} & GT & 313 & - & 62 \\ \cline{2-5}
\multirow{3}{*}{} & CC & 6 & 14 & - \\ \cline{1-5}
\end{tabular}
\end{table}
```

### Algorithms
``` LaTeX
% I prefer this package 
\usepackage[linesnumbered,ruled]{algorithm2e}

% Sample algorithm
\begin{algorithm}
\caption{caption}
\label{algorithm_label}
    \SetKwInOut{Input}{Input}
    \SetKwInOut{Output}{Output}
    \Input{Error bound: $\epsilon$}
    \Output{Bounded sub-optimal solution: $\pzero^\star$}
    $\pzero' = 50\%$; \\
    $\text{Profit}^\star=-\infty$;\\
    \While{$\pzero' <1.0$}{
            Solve Standard CSP (\ref{profit}) with fixed ..;\\
            \If{$\text{Profit}'>\text{Profit}^\star$}{
                $\pzero^\star = \pzero'$; \\
                $h^\star= h'$;\\
                  $r^\star= r'$;\\
                $\text{Profit}^\star=\text{Profit}'$;
            }
            $\pzero' = \pzero'+\epsilon$;
    }
\end{algorithm}
```

### Reference

``` LaTeX
\cite{}
```

### Math Formula
``` LaTeX
% Lemma
\begin{lemma} \label{lemma1}
Solve problem (\ref{~}) ...
\end{lemma}

% Proof
\begin{proof}
...
\end{proof}
```