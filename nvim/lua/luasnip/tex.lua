local generate_matrix = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, tostring(j) .. 'x1', i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t ' & ')
      table.insert(nodes, r(ins_indx, tostring(j) .. 'x' .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
    table.insert(nodes, t { '\\\\', '' })
  end
  -- fix last node.
  nodes[#nodes] = t '\\\\'
  return sn(nil, nodes)
end

local generate_function_cases = function(args, snip)
  local rows = tonumber(snip.captures[1])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, 'f' .. j, i(1)))
    table.insert(nodes, t ' & ')

    ins_indx = ins_indx + 1

    table.insert(nodes, r(ins_indx, 'case' .. j, i(1)))
    table.insert(nodes, t { '\\\\', '' })

    ins_indx = ins_indx + 1
  end
  -- fix last node.
  nodes[#nodes] = t '\\\\'
  return sn(nil, nodes)
end

local function math()
  return vim.api.nvim_eval 'vimtex#syntax#in_mathzone()' == 1
end

return {

  -- greek letters

  -- lowercase
  s({ trig = ';a', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\alpha' }),
  s({ trig = ';b', snippetType = 'autosnippet', desc = 'beta', wordTrig = false }, { t '\\beta' }),
  s({ trig = ';g', snippetType = 'autosnippet', desc = 'gamma', wordTrig = false }, { t '\\gamma' }),
  s({ trig = ';d', snippetType = 'autosnippet', desc = 'delta', wordTrig = false }, { t '\\delta' }),
  s({ trig = ';e', snippetType = 'autosnippet', desc = 'epsilon', wordTrig = false }, { t '\\epsilon' }),
  s({ trig = ';z', snippetType = 'autosnippet', desc = 'zeta', wordTrig = false }, { t '\\zeta' }),
  s({ trig = ';h', snippetType = 'autosnippet', desc = 'eta', wordTrig = false }, { t '\\eta' }),
  s({ trig = ';t', snippetType = 'autosnippet', desc = 'theta', wordTrig = false }, { t '\\theta' }),
  s({ trig = ';i', snippetType = 'autosnippet', desc = 'iota', wordTrig = false }, { t '\\iota' }),
  s({ trig = ';k', snippetType = 'autosnippet', desc = 'kappa', wordTrig = false }, { t '\\kappa' }),
  s({ trig = ';l', snippetType = 'autosnippet', desc = 'lambda', wordTrig = false }, { t '\\lambda' }),
  s({ trig = ';m', snippetType = 'autosnippet', desc = 'mu', wordTrig = false }, { t '\\mu' }),
  s({ trig = ';n', snippetType = 'autosnippet', desc = 'nu', wordTrig = false }, { t '\\nu' }),
  s({ trig = ';x', snippetType = 'autosnippet', desc = 'xi', wordTrig = false }, { t '\\xi' }),
  s({ trig = ';o', snippetType = 'autosnippet', desc = 'omicron', wordTrig = false }, { t '\\omicron' }),
  s({ trig = ';pi', snippetType = 'autosnippet', desc = 'pi', wordTrig = false }, { t '\\pi' }),
  s({ trig = ';r', snippetType = 'autosnippet', desc = 'rho', wordTrig = false }, { t '\\rho' }),
  s({ trig = ';s', snippetType = 'autosnippet', desc = 'sigma', wordTrig = false }, { t '\\sigma' }),
  s({ trig = ';u', snippetType = 'autosnippet', desc = 'tau', wordTrig = false }, { t '\\tau' }),
  s({ trig = ';y', snippetType = 'autosnippet', desc = 'upsilon', wordTrig = false }, { t '\\upsilon' }),
  s({ trig = ';ph', snippetType = 'autosnippet', desc = 'phi', wordTrig = false }, { t '\\phi' }),
  s({ trig = ';c', snippetType = 'autosnippet', desc = 'chi', wordTrig = false }, { t '\\chi' }),
  s({ trig = ';ps', snippetType = 'autosnippet', desc = 'psi', wordTrig = false }, { t '\\psi' }),
  s({ trig = ';w', snippetType = 'autosnippet', desc = 'omega', wordTrig = false }, { t '\\omega' }),

  -- uppercase
  s({ trig = ';G', snippetType = 'autosnippet', desc = 'Gamma (uppercase)', wordTrig = false }, { t '\\Gamma' }),
  s({ trig = ';D', snippetType = 'autosnippet', desc = 'Delta (uppercase)', wordTrig = false }, { t '\\Delta' }),
  s({ trig = ';T', snippetType = 'autosnippet', desc = 'Theta (uppercase)', wordTrig = false }, { t '\\Theta' }),
  s({ trig = ';L', snippetType = 'autosnippet', desc = 'Lambda (uppercase)', wordTrig = false }, { t '\\Lambda' }),
  s({ trig = ';X', snippetType = 'autosnippet', desc = 'Xi (uppercase)', wordTrig = false }, { t '\\Xi' }),
  s({ trig = ';Ph', snippetType = 'autosnippet', desc = 'Pi (uppercase)', wordTrig = false }, { t '\\Pi' }),
  s({ trig = ';S', snippetType = 'autosnippet', desc = 'Sigma (uppercase)', wordTrig = false }, { t '\\Sigma' }),
  s({ trig = ';U', snippetType = 'autosnippet', desc = 'Upsilon (uppercase)', wordTrig = false }, { t '\\Upsilon' }),
  s({ trig = ';F', snippetType = 'autosnippet', desc = 'Phi (uppercase)', wordTrig = false }, { t '\\Phi' }),
  s({ trig = ';Ps', snippetType = 'autosnippet', desc = 'Psi (uppercase)', wordTrig = false }, { t '\\Psi' }),
  s({ trig = ';O', snippetType = 'autosnippet', desc = 'Omega (uppercase)', wordTrig = false }, { t '\\Omega' }),

  -- Inline and Display Math

  s({ trig = 'mk', snippetType = 'autosnippet', desc = 'Inline Math', wordTrig = true }, fmta('$<>$', { i(1, '') })),

  s(
    { trig = 'dm', snippetType = 'autosnippet', desc = 'Display Math', wordTrig = true },
    fmta(
      [[
      \[<>.\]
      ]],
      { i(1, '') }
    )
  ),
  s(
    { trig = 'algn', snippetType = 'autosnippet', desc = 'Align environment', wordTrig = true },
    fmta(
      [[
      \begin{align*}
        <>
      .\end{align*}
      ]],
      { i(1, '') }
    )
  ),

  s(
    { trig = 'limit', snippetType = 'autosnippet', desc = 'Limit', wordTrig = true },
    fmta([[\lim_{<> \rightarrow <>}]], { i(1, ''), i(2, '\\infty') }),
    { condition = math }
  ),

  s(
    { trig = 'inprod', snippetType = 'autosnippet', desc = 'Inner Product', wordTrig = true },
    fmta([[\langle <>, <> \rangle]], { i(1, ''), i(2) }),
    { condition = math }
  ),

  -- figure
  s(
    { trig = 'fig', snippetType = 'snippet', dscr = 'A basic figure environment' },
    fmta(
      [[
        \begin{figure}
        \centering
        \includegraphics[width=0.9\linewidth]{<>}
        \caption{
            \textbf{<>}
            <>
            }
        \label{fig:<>}
        \end{figure}

        ]],
      { i(1, 'filename'), i(2, 'captionBold'), i(3, 'captionText'), i(4, 'figureLabel') }
    )
  ),

  -- create environment

  s(
    { trig = 'env', snippetType = 'snippet', dscr = 'Begin and end an arbitrary environment' },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
        ]],
      { i(1), i(2), rep(1) }
    )
  ),

  s(
    { trig = 'beg', snippetType = 'snippet', dscr = 'Create everything for a starting document' },
    fmta(
      [[
        \documentclass{<>}
        
        \usepackage{amsthm}
        \usepackage{amsmath}
        \usepackage{amsfonts}

        \title{<>}
        \author{Fergus Munro}


        \theoremstyle{definition}
        \newtheorem*{definition}{Definition}
        \newtheorem*{example}{Example}

        \theoremstyle{plain}
        \newtheorem*{theorem}{Theorem}
        \newtheorem*{lemma}{Lemma}
        \newtheorem*{proposition}{Proposition}

        \begin{document}
            \maketitle
            <>
        \end{document}
        ]],
      { i(1), i(2), i(3) }
    )
  ),

  s({ trig = 'fraction', snippetType = 'snippet', wordTrig = false, desc = 'creates fraction' }, fmta([[\frac{<>}{<>}]], { i(1), i(2) })),

  s(
    { trig = 'prob', snippetType = 'autosnippet', desc = 'probability symbol', wordTrig = false },
    fmta([[\mathbb{P}(<>)<>]], { i(1), i(2) }),
    { condition = math }
  ),

  -- real, natural etc numbers

  s({ trig = 'real', snippetType = 'autosnippet', desc = 'real numbers', wordTrig = false }, { t '\\mathbb{R}' }, { condition = math }),

  s({ trig = 'integers', snippetType = 'autosnippet', desc = 'integer numbers', wordTrig = false }, { t '\\mathbb{Z}' }, { condition = math }),

  s({ trig = 'natural', snippetType = 'autosnippet', desc = 'natural numbers', wordTrig = false }, { t '\\mathbb{N}' }, { condition = math }),

  s({ trig = 'rational', snippetType = 'autosnippet', desc = 'rational numbers', wordTrig = false }, { t '\\mathbb{Q}' }, { condition = math }),

  s({ trig = 'complex', snippetType = 'autosnippet', desc = 'complex numbers', wordTrig = false }, { t '\\mathbb{C}' }, { condition = math }),

  s({ trig = 'field', snippetType = 'autosnippet', desc = 'field symbol', wordTrig = false }, { t '\\mathbb{F}' }, { condition = math }),

  -- postfixes

  postfix(
    { trig = 'hat', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr = 'postfix hat when in math mode' },
    { l('\\hat{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),

  postfix(
    { trig = 'norm', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr = 'postfix norm when in math mode' },
    { l('\\norm{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),

  postfix(
    { trig = 'vec', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr = 'postfix vec when in math mode' },
    { l('\\vec{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),
  postfix(
    { trig = 'under', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr = 'postfix underline when in math mode' },
    { l('\\underline{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),

  postfix(
    { trig = 'bar', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr = 'postfix bar when in math mode' },
    { l('\\bar{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),

  postfix(
    { trig = 'bold', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr = 'postfix bold when in math mode' },
    { l('\\bf{' .. l.POSTFIX_MATCH .. '}') }
  ),

  -- fractions
  postfix(
    { trig = '/', match_pattern = [[[\\%w%^%_%(%)]+$]], snippetType = 'autosnippet', dscr = 'fraction' },
    --{ l('\\frac{' .. l.POSTFIX_MATCH .. '}{}') },

    fmta([[\frac{<>}{<>}]], {
      f(function(_, snip)
        local m = snip.env.POSTFIX_MATCH or ''
        if m:match '^%b()$' then
          return m:sub(2, -2)
        end
        return m
      end),
      i(1),
    }),
    { condition = math }
  ),

  -- integral

  s(
    { trig = ';I', snippetType = 'autosnippet', desc = 'integral with infinite or inserted limits', wordTrig = false },
    fmta(
      [[
        <>
        ]],
      {
        c(1, {
          t '\\int ',
          t '\\int_{-\\infty}^\\infty ',
          sn(nil, fmta([[ \int_{<>}^{<>} ]], { i(1), i(2) })),
        }),
      }
    )
  ),

  -- summation

  s({ trig = 'summation', snippetType = 'snippet', dscr = 'Sum notation' }, fmta([[\sum_{ <> = <>}^{<>}]], { i(1, 'i'), i(2, '1'), i(3, 'n') })),

  -- function cases

  s(
    {
      trig = 'Cases(%d+)',
      snippetType = 'autosnippet',
      regTrig = true,
      wordTrig = false,
      dscr = 'Function with n cases',
      docstring = '',
    },
    fmta(
      [[
      \left\{\begin{array}{lr}
      <>
      \end{array} \right.
    ]],
      {

        d(1, generate_function_cases),
      }
    ),
    { show_condition = math }
  ),

  -- matrix

  s(
    {
      trig = '([%sbBpvV])Mat(%d+)x(%d+)',
      snippetType = 'autosnippet',
      regTrig = true,
      wordTrig = false,
      dscr = '[bBpvV]matrix of A x B size',
      docstring = '',
    },
    fmta(
      [[
    \begin{<>}
    <>
    \end{<>}]],
      {
        f(function(_, snip)
          if snip.captures[1] == ' ' then
            return 'matrix'
          else
            return snip.captures[1] .. 'matrix'
          end
        end),
        d(1, generate_matrix),
        f(function(_, snip)
          return snip.captures[1] .. 'matrix'
        end),
      }
    ),
    { show_condition = math }
  ),
}
