-- Create table to store the market information

CREATE TABLE MARKET_HISTORY (
CLOSE_DT DATE PRIMARY KEY,
DJIA FLOAT(8),
NASDAQ FLOAT(8),
SP500 FLOAT(8),
BTC FLOAT(8),
ETH FLOAT(8),
XPR FLOAT(8),
EUR FLOAT(8),
GBP FLOAT(8),
RUB FLOAT(8)
);

-- Create view to normalize the results as of the first day with data

CREATE OR REPLACE VIEW public.market_history_normalized AS
 SELECT market_history.close_dt,
    market_history.djia / (( SELECT market_history_1.djia
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.djia > 0::double precision)))) AS djia,
    market_history.nasdaq / (( SELECT market_history_1.nasdaq
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.nasdaq > 0::double precision)))) AS nasdaq,
    market_history.sp500 / (( SELECT market_history_1.sp500
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.sp500 > 0::double precision)))) AS sp500,
    market_history.btc / (( SELECT market_history_1.btc
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.btc > 0::double precision)))) AS btc,
    market_history.eth / (( SELECT market_history_1.eth
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.eth > 0::double precision)))) AS eth,
    market_history.xpr / (( SELECT market_history_1.xpr
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.xpr > 0::double precision)))) AS xpr,
    market_history.eur / (( SELECT market_history_1.eur
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.eur > 0::double precision)))) AS eur,
    market_history.gbp / (( SELECT market_history_1.gbp
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.gbp > 0::double precision)))) AS gbp,
    market_history.rub / (( SELECT market_history_1.rub
           FROM market_history market_history_1
          WHERE market_history_1.close_dt = (( SELECT min(market_history_2.close_dt) AS min
                   FROM market_history market_history_2
                  WHERE market_history_2.rub > 0::double precision)))) AS rub
   FROM market_history;
