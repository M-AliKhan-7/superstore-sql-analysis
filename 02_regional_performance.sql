{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww16880\viewh19080\viewkind0
\deftab720
\pard\pardeftab720\sl368\sa213\partightenfactor0

\f0\fs36 \cf2 \expnd0\expndtw0\kerning0
Query 2: Sales & Profit Performance by Region\
Insight: Surfaces underperforming regions despite high revenue\
\
SELECT\
\'a0\'a0\'a0 region,\
\'a0\'a0\'a0 COUNT(DISTINCT order_id)\'a0	\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0		\'a0\'a0\'a0\'a0\'a0\'a0			AS total_orders,\
\'a0\'a0\'a0 ROUND(SUM(Sales), 2)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0		\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0				AS total_Sales,\
\'a0\'a0\'a0 ROUND(SUM(Profit), 2)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 						AS total_profit,\
\'a0\'a0\'a0 ROUND(SUM(Profit) / SUM(Sales) * 100, 1)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 				AS profit_margin_pct,\
\pard\pardeftab720\partightenfactor0
\cf2     ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) 	AS revenue_per_customer\
\pard\pardeftab720\sl368\sa213\partightenfactor0
\cf2 \
FROM SampleSuperstore\
GROUP BY region\
ORDER BY total_Sales DESC;\
\'a0\
RESULTS:\
\'a0\
region	total_orders	total_Sales	total_profit	profit_margin_pct	revenue_per_customer\'a0\
West		1611	725457.82	108418.45	14.9				1057.52\
East		1401	678781.24	91522.78	13.5				1007.09\
Central		1175	501239.89	39706.36	7.9				796.88\
South		822		391721.91	46749.43	11.9				765.08\
\
KEY INSIGHT: South is more efficient with fewer orders, while Central has nearly double the orders but a worse margin. This suggests a discounting or product-mix issue, not a demand issue.\
}