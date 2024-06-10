# SQLスクリプトファイルの実行方法

4章で使用するサンプルテーブルを作成するには、次のスクリプトファイルを実行します。

* **MySQL** —— [`ch04_MySQL_sample_data.sql`](ch04_MySQL_sample_data.sql)
* **Oracle** —— [`ch04_Oracle_sample_data.sql`](ch04_Oracle_sample_data.sql)
* **SQL Server** —— [`ch04_SQLServer_sample_data.sql`](ch04_SQLServer_sample_data.sql)
* **PostgreSQL** —— [`ch04_PostgreSQL_sample_data.sql`](ch04_PostgreSQL_sample_data.sql)
* **SQLite** —— [`ch04_SQLite_sample_data.sql`](ch04_SQLite_sample_data.sql)

それぞれのRDBMSで上記のスクリプトファイルを実行するには、次のようにします（必要に応じてパス名を指定してください）。または、ファイル内のSQL文をコピーして直接実行してください。

* **MySQL** —— MySQL（`mysql`コマンド）を起動し、次のコマンドを実行する

	```
	source ch04_MySQL_sample_data.sql
	```

* **Oracle** —— SQL\*Plus（`sqlplus`コマンド）を起動し、次のコマンドを実行する

	```
	start ch04_Oracle_sample_data.sql
	```

* **SQL Server** —— `sqlcmd`ユーティリティを起動し、次のコマンドを実行する

	```
	:r ch04_SQLServer_sample_data.sql
	```

* **PostgreSQL** —— PostgreSQL（`psql`コマンド）を起動し、次のコマンドを実行する

	```
	\i ch04_PostgreSQL_sample_data.sql
	```

* **SQLite** —— SQLite（`sqlite3`コマンド）を起動し、次のコマンドを実行する

	```
	.read ch04_SQLite_sample_data.sql
	```
