{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 .SFNS-Regular_wdth_opsz110000_GRAD_wght2BC0000;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red11\green11\blue11;\red0\green0\blue0;\red85\green83\blue78;
}
{\*\expandedcolortbl;;\cssrgb\c4314\c4314\c4314;\cssrgb\c0\c0\c0;\cssrgb\c40784\c40000\c38039;
}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{hyphen\}}{\leveltext\leveltemplateid1\'01\uc0\u8259 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid1}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}}
\paperw11900\paperh16840\margl1440\margr1440\vieww34000\viewh21460\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\b\fs36 \cf2 \expnd0\expndtw0\kerning0
Query 1
\f1\b0 : Revenue, Profit & Margin by Product Category\cf3 \
\cf4 \'a0\cf3 \
\cf2 Insight: Identifies which categories drive revenue vs profit\cf3 \
\cf4 \'a0\cf3 \
\cf2 SELECT\cf3 \
\cf2 \'a0\'a0\'a0 category,\cf3 \
\cf2 \'a0\'a0\'a0 COUNT(DISTINCT order_id)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 	 	AS total_orders,\cf3 \
\cf2 \'a0\'a0\'a0 ROUND(SUM(Sales), 2)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 		AS total_revenue,\cf3 \
\cf2 \'a0\'a0\'a0 ROUND(SUM(Profit), 2)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 		 	AS total_profit,\cf3 \
\cf2 \'a0\'a0\'a0 ROUND(SUM(Profit) / SUM(Sales) * 100, 1)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 	AS profit_margin_pct,\cf3 \
\pard\tx220\tx720\pardeftab720\li720\fi-720\partightenfactor0
\ls1\ilvl0\cf2 {\listtext	\uc0\u8259 	}\'a0\'a0\'a0 ROUND(AVG(Discount) * 100, 1)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 	 	AS avg_discount_pct\cf3 \
\pard\pardeftab720\partightenfactor0
\cf2 FROM SampleSuperstore\cf3 \
\cf2 GROUP BY Category\cf3 \
\cf2 ORDER BY total_revenue DESC;\cf3 \
\cf2 \'a0\cf3 \
\cf4 \'a0\cf3 \
\cf2 RESULTS (Superstore dataset ~9,994 rows):\cf3 \
\cf2 \'a0\cf3 \
\cf2 Category\'a0		\'a0\'a0\'a0\'a0\'a0\'a0 | total_orders | total_revenue | total_profit | profit_margin_pct | avg_discount_pct\cf3 \
\cf4 \'a0\cf3 \
\cf2 "Technology"\'a0 \'a0\'a0	    "1544"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0"836154.03"\'a0\'a0\'a0 "145454.95"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 "17.4"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0"13.2"\cf3 \
\cf2 "Furniture"\'a0\'a0\'a0\'a0\'a0 \'a0\'a0\'a0\'a0 	    "1764"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0"741999.8"\'a0\'a0\'a0\'a0\'a0  "18451.27"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 "2.5"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0"17.4"\cf3 \
\cf2 "Office Supplies"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 "3742"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0"719047.03"\'a0\'a0\'a0  "122490.8"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 "17"\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0"15.7"\cf3 \
\cf2 \'a0\'a0\cf3 \
\cf4 \'a0\cf3 \
\cf2 Key Insight: \cf3 Furniture\'92s margin is being significantly eroded by the highest discount rate among all categories, resulting in a compressed margin of 2.5% compared to 17% for Technology and Office Supplies.}