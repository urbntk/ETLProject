# ETLProject

We wanted to determine how cryptocurrencies fare compared to other investments. We use US Market data for three different type of investments: 
US Market Indicators, Cryptocurrencies and Foreign Currencies.

We selected three assets from each category:

US Markets:

* DJIA

* SP500

* NASDAQ

Crypto Currencies:

* Bitcoin

* Etherium

* Ripple

Foreign Currencies:

* Euro

* British Pound

* Russian Rubble 

We downloaded CSV data since 01/01/2015 for all assets from Investing.com. 

We use Pandas to load the data into dataframes. We used infer_datetime_format and pd.to_datetime to transform text data into a pandas datetime object.
We use the merge command to join all data into one common dataframe with a single Date field.

We removed commas from the text representation of the numeric fields in order to converted into float dataframes.

We use the fillna function to transform null values into zero values.

We used matplotlib to validate the data

We created an AWS account to load the data into a postgresql database that could be accessed by everybody in the group.

The loaded the data into the AWS database and we created a view to normalize the results.

US Market indicators show a great return about 50% for the last four years

Bitcoin shows a return of  368% for the same period.

Etherium shows a return of 179% for the same period.

The Russan Rubble has a lot of volatility.

The British Pound continues to  decline against the US Dollar

The Euro has remain mostly unchanged.

