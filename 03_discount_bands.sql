{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{hyphen\}}{\leveltext\leveltemplateid1\'01\uc0\u8259 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid1}
{\list\listtemplateid2\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{hyphen\}}{\leveltext\leveltemplateid101\'01\uc0\u8259 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid2}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}{\listoverride\listid2\listoverridecount0\ls2}}
\paperw11900\paperh16840\margl1440\margr1440\vieww16920\viewh8880\viewkind0
\deftab720
\pard\pardeftab720\sl368\sa213\partightenfactor0

\f0\fs36 \cf2 \expnd0\expndtw0\kerning0
Query 3: Margin Erosion by Discount Band\
Insight: Quantifies the profit damage caused by heavy discounting\
\
SELECT\
\'a0\'a0\'a0 CASE\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 WHEN discount = 0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 		THEN 'No Discount'\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 WHEN discount <= 0.10\'a0\'a0\'a0 	THEN '1-10%'\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sl368\sa213\partightenfactor0
\ls1\ilvl0\cf2 \kerning1\expnd0\expndtw0 {\listtext	\uc0\u8259 	}\expnd0\expndtw0\kerning0
WHEN discount <= 0.20\'a0\'a0	THEN '11-20%'\
\pard\pardeftab720\sl368\sa213\partightenfactor0
\cf2 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 WHEN discount <= 0.30\'a0\'a0\'a0 	THEN '21-30%'\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0 ELSE\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 		'31%+'\
\'a0\'a0\'a0 END\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 					AS discount_band,\
\'a0\'a0\'a0 COUNT(*)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 					AS transactions,\
\'a0\'a0\'a0 ROUND(SUM(sales), 2)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 				AS total_revenue,\
\'a0\'a0\'a0 ROUND(SUM(profit), 2)\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 				AS total_profit,\
\'a0\'a0\'a0 ROUND(SUM(profit) /SUM(sales) * 100, 1)\'a0\'a0\'a0\'a0\'a0\'a0\'a0 	AS profit_margin_pct\
FROM SampleSuperstore\
GROUP BY discount_band;\
\'a0\
RESULTS:\
discount_band		transactions	total_revenue		total_profit	profit_margin_pct\
1-10%				94			54369.35			9029.18			16.6\
11-20%				3709 		792152.89			91756.3			11.6\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sl368\sa213\partightenfactor0
\ls2\ilvl0\cf2 {\listtext	\uc0\u8259 	}21-30%				227			103226.65			-10369.28		-10\
\pard\pardeftab720\sl368\sa213\partightenfactor0
\cf2 31%+				1166 		259543.49			-125006.78		-48.2\
No Discount			4798		1087908.47			320987.6		29.5\
\'a0\
KEY INSIGHT: Discounts exceeding 20% lead to losses, particularly in the 31%+ range, as seen in 1,166 transactions generating \'a3259k in revenue but incurring a \'a3125k loss. \
}