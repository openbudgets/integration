--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

\connect obeu_dam

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: graphname; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE graphname (
    id integer NOT NULL,
    gname character(250)
);


ALTER TABLE graphname OWNER TO postgres;

--
-- Data for Name: graphname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY graphname (id, gname) FROM stdin;
1	http://www.openlinksw.com/schemas/virtrdf#
2	http://www.w3.org/ns/ldp#
3	http://localhost:8890/sparql
4	http://localhost:8890/DAV/
5	http://www.w3.org/2002/07/owl#
6	http://data.openbudgets.eu/resource/graph/test3
7	http://data.openbudgets.eu/resource/graph/fghfgh
8	http://data.openbudgets.eu/resource/graph/test
9	http://data.openbudgets.eu/resource/graph/begrotingsstatenv8
10	http://data.openbudgets.eu/resource/graph/finnish_budget_2014
11	http://data.openbudgets.eu/resource/graph/my-openspending-datapackage
12	http://data.openbudgets.eu/resource/graph/testfdp1
13	http://data.openbudgets.eu/resource/codelist/budget-phase
14	http://data.openbudgets.eu/resource/dataset/testfdp5
15	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2011
16	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2011
17	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2011
18	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2011
19	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2012
20	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2012
21	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2012
22	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2012
23	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2013
24	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2013
25	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2013
26	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2013
27	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2014
28	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2014
29	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2014
30	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2014
31	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2015
32	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2015
33	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2015
34	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2015
35	http://data.openbudgets.eu/resource/graph/testfdp5
36	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2016
37	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2016
38	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2016
39	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2016
40	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2006
41	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2006
42	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2007
43	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2007
44	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2008
45	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2008
46	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2009
47	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2009
48	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2010
49	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2010
50	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2011
51	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2011
52	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2012
53	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2012
54	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2013
55	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2013
56	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2014
57	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2014
58	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2015
59	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2015
60	http://data.openbudgets.eu/resource/codelist/estructura_economica_i_aragon_2016
61	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_i_aragon_2016
62	http://data.openbudgets.eu/resource/codelist/kae-ota-exodwn-2014
63	http://data.openbudgets.eu/resource/dataset/greek-municipalities/codelist/athens-administrations
64	http://data.openbudgets.eu/resource/codelist/kae-ota-esodwn-2014
65	http://data.openbudgets.eu/resource/codelist/kae-ota-administration-2014
66	http://data.openbudgets.eu/resource/dataset/budget-bonn-kostenstellen-2016/codelist
67	http://data.openbudgets.eu/aux
68	http://openbudgets.eu/model
69	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2006
70	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2006
71	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2006
72	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2006
73	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2007
74	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2007
75	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2007
76	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2007
77	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2008
78	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2008
79	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2008
80	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2008
81	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2009
82	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2009
83	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2009
84	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2009
85	http://data.openbudgets.eu/resource/codelist/estructura_economica_g_aragon_2010
86	http://data.openbudgets.eu/resource/codelist/estructura_financiacion_g_aragon_2010
87	http://data.openbudgets.eu/resource/codelist/estructura_funcional_aragon_2010
88	http://data.openbudgets.eu/resource/codelist/estructura_organica_aragon_2010
89	http://data.openbudgets.eu/resource/codelist/kae-ota
90	http://data.openbudgets.eu/resource/dataset/aragon-2006-expenditure
91	http://data.openbudgets.eu/resource/dataset/aragon-2007-expenditure
92	http://data.openbudgets.eu/resource/dataset/aragon-2008-expenditure
93	http://data.openbudgets.eu/resource/dataset/aragon-2009-expenditure
94	http://data.openbudgets.eu/resource/dataset/aragon-2010-expenditure
95	http://data.openbudgets.eu/resource/dataset/aragon-2011-expenditure
96	http://data.openbudgets.eu/resource/dataset/aragon-2012-expenditure
97	http://data.openbudgets.eu/resource/dataset/aragon-2013-expenditure
98	http://data.openbudgets.eu/resource/dataset/aragon-2014-expenditure
99	http://data.openbudgets.eu/resource/dataset/aragon-2015-expenditure
100	http://data.openbudgets.eu/resource/dataset/aragon-2016-expenditure
101	http://data.openbudgets.eu/resource/dataset/aragon-2006-income
102	http://data.openbudgets.eu/resource/dataset/aragon-2007-income
103	http://data.openbudgets.eu/resource/dataset/aragon-2008-income
104	http://data.openbudgets.eu/resource/dataset/aragon-2009-income
105	http://data.openbudgets.eu/resource/dataset/aragon-2010-income
106	http://data.openbudgets.eu/resource/dataset/aragon-2011-income
107	http://data.openbudgets.eu/resource/dataset/aragon-2012-income
108	http://data.openbudgets.eu/resource/dataset/aragon-2013-income
109	http://data.openbudgets.eu/resource/dataset/aragon-2014-income
110	http://data.openbudgets.eu/resource/dataset/aragon-2015-income
111	http://data.openbudgets.eu/resource/dataset/aragon-2016-income
113	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2015
114	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2004/codelist
115	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2005/codelist
116	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2006/codelist
117	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2007/codelist
118	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2008/codelist
119	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2009/codelist
120	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2010/codelist
121	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2011/codelist
122	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2012/codelist
123	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2013/codelist
124	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2014/codelist
125	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2015/codelist
126	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2004/codelist
127	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2005/codelist
128	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2006/codelist
129	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2007/codelist
130	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2008/codelist
131	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2009/codelist
132	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2010/codelist
133	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2011/codelist
134	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2012/codelist
135	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2013/codelist
136	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2014/codelist
137	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2015/codelist
138	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2004
139	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2005
140	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2006
141	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2007
142	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2008
143	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2009
144	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2010
145	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2011
146	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2012
147	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2013
148	http://data.openbudgets.eu/resource/dataset/budget-athens-expenditure-2014
149	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2004
150	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2005
151	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2006
152	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2007
153	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2008
154	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2009
155	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2010
156	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2011
157	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2012
158	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2013
159	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2014
160	http://data.openbudgets.eu/resource/dataset/budget-athens-revenue-2015
161	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2010/codelist
162	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2011/codelist
163	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2012/codelist
164	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2013/codelist
165	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2014/codelist
166	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2015/codelist
167	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2010/codelist
168	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2011/codelist
169	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2012/codelist
170	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2013/codelist
171	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2014/codelist
172	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2015/codelist
173	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2010
174	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2011
175	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2012
176	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2013
177	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2014
178	http://data.openbudgets.eu/resource/dataset/budget-heraklion-expenditure-2015
179	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2010
180	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2011
181	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2012
182	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2013
183	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2014
184	http://data.openbudgets.eu/resource/dataset/budget-heraklion-revenue-2015
185	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2002/codelist
186	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2003/codelist
187	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2004/codelist
188	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2005/codelist
189	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2006/codelist
190	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2007/codelist
191	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2008/codelist
192	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2009/codelist
193	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2010/codelist
194	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2011/codelist
195	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2012/codelist
196	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2013/codelist
197	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2014/codelist
198	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2015/codelist
199	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2016/codelist
200	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2002/codelist
201	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2003/codelist
202	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2004/codelist
203	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2005/codelist
204	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2006/codelist
205	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2007/codelist
206	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2008/codelist
207	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2009/codelist
208	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2010/codelist
209	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2011/codelist
210	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2012/codelist
211	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2013/codelist
212	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2014/codelist
213	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2015/codelist
214	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2016/codelist
215	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2002
216	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2003
217	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2004
218	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2005
219	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2006
220	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2007
221	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2008
222	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2009
223	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2010
224	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2011
225	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2012
226	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2013
227	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2014
228	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2015
229	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-expenditure-2016
230	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2002
231	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2003
232	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2004
233	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2005
234	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2006
235	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2007
236	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2008
237	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2009
238	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2010
239	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2011
240	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2012
241	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2013
242	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2014
243	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2015
244	http://data.openbudgets.eu/resource/dataset/budget-kalamaria-revenue-2016
245	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-expenditure-2014/codelist
246	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-expenditure-2015/codelist
247	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-expenditure-2016/codelist
248	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-revenue-2014/codelist
249	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-revenue-2015/codelist
250	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-revenue-2016/codelist
251	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-expenditure-2014
252	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-expenditure-2015
253	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-expenditure-2016
254	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-revenue-2014
255	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-revenue-2015
256	http://data.openbudgets.eu/resource/dataset/budget-karpenisi-revenue-2016
257	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2010/codelist
258	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2011/codelist
259	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2012/codelist
260	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2013/codelist
261	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2014/codelist
262	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2015/codelist
263	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2016/codelist
264	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2010/codelist
265	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2011/codelist
266	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2012/codelist
267	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2013/codelist
268	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2014/codelist
269	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2015/codelist
270	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2016/codelist
271	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2010
272	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2011
273	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2012
274	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2013
275	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2014
276	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2015
277	http://data.openbudgets.eu/resource/dataset/budget-katerini-expenditure-2016
278	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2010
279	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2011
280	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2012
281	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2013
282	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2014
283	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2015
284	http://data.openbudgets.eu/resource/dataset/budget-katerini-revenue-2016
285	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2010/codelist
286	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2011/codelist
287	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2012/codelist
288	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2013/codelist
289	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2014/codelist
290	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2015/codelist
291	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2010/codelist
292	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2011/codelist
293	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2012/codelist
294	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2013/codelist
295	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2014/codelist
296	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2015/codelist
297	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2010
298	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2011
299	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2012
300	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2013
301	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2014
302	http://data.openbudgets.eu/resource/dataset/budget-kilkis-expenditure-2015
303	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2010
304	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2011
305	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2012
306	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2013
307	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2014
308	http://data.openbudgets.eu/resource/dataset/budget-kilkis-revenue-2015
309	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2011/codelist
310	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2012/codelist
311	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2013/codelist
312	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2014/codelist
313	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2015/codelist
314	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2016/codelist
315	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2011/codelist
316	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2012/codelist
317	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2013/codelist
318	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2014/codelist
319	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2015/codelist
320	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2016/codelist
321	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2011
322	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2012
323	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2013
324	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2014
325	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2015
326	http://data.openbudgets.eu/resource/dataset/budget-naousa-expenditure-2016
327	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2011
328	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2012
329	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2013
330	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2014
331	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2015
332	http://data.openbudgets.eu/resource/dataset/budget-naousa-revenue-2016
333	http://data.openbudgets.eu/resource/dataset/budget-rethymno-expenditure-2016/codelist
334	http://data.openbudgets.eu/resource/dataset/budget-rethymno-revenues-2016/codelist
335	http://data.openbudgets.eu/resource/dataset/budget-rethymno-expenditure-2016
336	http://data.openbudgets.eu/resource/dataset/budget-rethymno-revenues-2016
337	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2010/codelist
338	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2011/codelist
339	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2012/codelist
340	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2013/codelist
341	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2014/codelist
342	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2015/codelist
343	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2016/codelist
344	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2010/codelist
345	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2011/codelist
346	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2012/codelist
347	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2013/codelist
348	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2014/codelist
349	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2015/codelist
350	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2016/codelist
351	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2010
352	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2011
353	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2012
354	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2013
355	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2014
356	http://data.openbudgets.eu/resource/dataset/budget-sithonia-expenditure-2015
357	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2010
358	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2011
359	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2012
360	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2013
361	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2014
362	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2015
363	http://data.openbudgets.eu/resource/dataset/budget-sithonia-revenue-2016
364	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2011/codelist
365	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2012/codelist
366	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2013/codelist
367	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2014/codelist
368	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2015/codelist
369	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2011/codelist
370	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2012/codelist
371	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2013/codelist
372	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2014/codelist
373	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2015/codelist
374	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2011
375	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2012
376	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2013
377	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2014
378	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-expenditure-2015
379	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2011
380	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2012
381	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2013
382	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2014
383	http://data.openbudgets.eu/resource/dataset/budget-thessaloniki-revenue-2015
384	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2010/codelist
385	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2011/codelist
386	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2012/codelist
387	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2013/codelist
388	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2014/codelist
389	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2015/codelist
390	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2016/codelist
391	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2010/codelist
392	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2011/codelist
393	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2012/codelist
394	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2013/codelist
395	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2014/codelist
396	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2015/codelist
397	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2016/codelist
398	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2010
399	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2011
400	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2012
401	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2013
402	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2014
403	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2015
404	http://data.openbudgets.eu/resource/dataset/budget-veroia-expenditure-2016
405	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2010
406	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2011
407	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2012
408	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2013
409	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2014
410	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2015
411	http://data.openbudgets.eu/resource/dataset/budget-veroia-revenue-2016
412	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2011/codelist
413	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2012/codelist
414	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2013/codelist
415	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2014/codelist
416	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2015/codelist
417	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2016/codelist
418	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2011/codelist
419	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2012/codelist
420	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2013/codelist
421	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2014/codelist
422	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2015/codelist
423	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2016/codelist
424	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2011
425	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2012
426	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2013
427	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2014
428	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2015
429	http://data.openbudgets.eu/resource/dataset/budget-epirus-expenditure-2016
430	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2011
431	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2012
432	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2013
433	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2014
434	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2015
435	http://data.openbudgets.eu/resource/dataset/budget-epirus-revenue-2016
436	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2011/codelist
437	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2012/codelist
438	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2013/codelist
439	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2014/codelist
440	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2015/codelist
441	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2016/codelist
442	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2011/codelist
443	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2012/codelist
444	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2013/codelist
445	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2014/codelist
446	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2015/codelist
447	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2016/codelist
448	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2011
449	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2012
450	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2013
451	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2014
452	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2015
453	http://data.openbudgets.eu/resource/dataset/budget-saegean-expenditure-2016
454	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2011
455	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2012
456	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2013
457	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2014
458	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2015
459	http://data.openbudgets.eu/resource/dataset/budget-saegean-revenue-2016
460	http://data.openbudgets.eu/resource/dataset/id
461	http://data.openbudgets.eu/resource/codelist/organization-identifier
462	http://data.openbudgets.eu/resource/codelist/cl-geo
463	http://data.openbudgets.eu/resource/codelist/cpa
464	http://data.openbudgets.eu/resource/codelist/cpc
465	http://data.openbudgets.eu/resource/codelist/currency
466	http://data.openbudgets.eu/resource/codelist/esa2010-assets-and-liabilities
467	http://data.openbudgets.eu/resource/codelist/esa2010-balancing-items-and-net-worth
468	http://data.openbudgets.eu/resource/codelist/esa2010-distributive-transactions
469	http://data.openbudgets.eu/resource/codelist/esa2010-financial-assets
470	http://data.openbudgets.eu/resource/codelist/esa2010-institutional-sectors
471	http://data.openbudgets.eu/resource/codelist/esa2010-non-financial-assets
472	http://data.openbudgets.eu/resource/codelist/esa2010-other-changes-in-assets
473	http://data.openbudgets.eu/resource/codelist/esa2010-transactions-in-products
474	http://data.openbudgets.eu/resource/codelist/icatus
475	http://data.openbudgets.eu/resource/codelist/isco_1988
476	http://data.openbudgets.eu/resource/codelist/catpol
477	http://data.openbudgets.eu/resource/codelist/oenace
478	http://data.openbudgets.eu/resource/codelist/prodcom
479	http://data.openbudgets.eu/resource/codelist/sitc
480	http://data.openbudgets.eu/resource/codelist/sitc_austria
481	http://data.openbudgets.eu/resource/codelist/stakod-greek
482	http://data.openbudgets.eu/resource/dataset/budget-bonn-aemterhierarchie-2016/codelist
483	http://data.openbudgets.eu/resource/dataset/budget-bonn-kontierungselemente-2016/codelist
484	http://data.openbudgets.eu/resource/dataset/budget-bonn-kostenartengruppe-2016/codelist
485	http://data.openbudgets.eu/resource/dataset/budget-bonn-operationcharacter-2016/codelist
486	http://data.openbudgets.eu/resource/dataset/budget-bonn-produktuebersicht-2016/codelist
487	http://data.openbudgets.eu/resource/dataset/budget-bonn-innenauftraege-2016/codelist
488	http://data.openbudgets.eu/resource/dataset/budget-bonn-pspelemente-2016/codelist
489	http://data.openbudgets.eu/resource/dataset/budget-bonnaggregatedamounts-revenue-2016
490	http://data.openbudgets.eu/resource/dataset/budget-draft-revenue-2017-2025
\.


--
-- Name: graphname_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY graphname
    ADD CONSTRAINT graphname_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: tdong
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

