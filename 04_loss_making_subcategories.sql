{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww16900\viewh8860\viewkind0
\deftab720
\pard\pardeftab720\sa320\partightenfactor0

\f0\fs36 \cf2 \expnd0\expndtw0\kerning0
Query 4: Loss-Making Sub-Categories (Subquery technique)\
Insight: Pinpoints exactly which product lines are unprofitable\
\pard\pardeftab720\sl368\sa213\partightenfactor0
\cf2 \
SELECT * FROM (\
\'a0 SELECT\
\'a0 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 sub_category,\
\'a0 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 ROUND(SUM(sales),2) AS total_revenue,\
\'a0 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 ROUND(SUM(profit),2) AS total_profit\
\'a0 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 FROM SampleSuperstore\
\'a0 		GROUP BY sub_category\
\'a0 )\
\'a0 \
\'a0WHERE total_profit < 0\
\'a0ORDER BY total_profit ASC;\
\pard\pardeftab720\sa320\partightenfactor0
\cf2 \
 RESULTS:\
sub_category		total_revenue	total_profit\
Tables				206965.53		-17725.48\
Bookcases			114880			-3472.56\
Supplies				46673.54		-1189.1\'a0\
\'a0\
KEY INSIGHT: \cf0 Tables generate \'a3207,000 in revenue but lose \'a317,000, as a low 2.5% category profit margin makes large furniture sub-categories like tables and bookcases unprofitable\cf2 \
\
}