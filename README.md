# Projekt SQL: Analýza dostupnosti potravin v kontextu mezd

## 1. Zadání projektu

Na analytickém oddělení nezávislé společnosti zabývající se životní úrovní občanů bylo cílem odpovědět na několik vymezených výzkumných otázek, které zkoumají dostupnost základních potravin v kontextu průměrných mezd. Závěrečný výstup je určen pro prezentaci na odborné konferenci.

## 2. Popis tabulek a anomálií

### Vstupní datové tabulky

Projekt využívá následující tabulky:

* `czechia_payroll`
* `czechia_payroll_industry_branch`
* `czechia_payroll_calculation`
* `czechia_payroll_unit`
* `czechia_payroll_value_type`
* `czechia_price`
* `czechia_price_category`
* `economies`
* `countries`

### Primární tabulka `t_adam_seifert_project_sql_primary_final`

Obsahuje:

* Rok (`calendar_year`)
* Odvětví pracovního trhu (`industry_branch_name`)
* Průměrnou mzdu v Kč (`avg_monthly_wage_czk`)
* Průměrný počet zaměstnanců v tisících (`avg_employees_thousands`)
* Metodu výpočtu zaměstnanců (`method_of_employee_count`)
* Informace o potravině: název, jednotka, množství, cena

### Sekundární tabulka `t_adam_seifert_project_sql_secondary_final`

Obsahuje HDP, GINI koeficient a populaci evropských států v období, které odpovídá primárním datům o ČR.

### Detekované anomálie:

* **Záznamy o potravinách do roku 2014** obsahují pouze **26 druhů**, zatímco **od roku 2015** se eviduje **27 druhů**. Po roce 2015 byla do dat přidána položka *jakostní víno bílé*. Ve starších letech tato potravina chybí.
* **Mnoho `NULL` hodnot** u mezd a zaměstnanců je způsobeno strukturou tabulky – každý řádek obsahuje buď mzdovou nebo zaměstnaneckou informaci.
* **V sekundárních tabulkách chybí vazby** – tabulky `economies` a `countries` nejsou navzájem jednoznačně propojené.
* V tabulce `economies` je sloupec `mortaliy_under5` s pravopisnou chybou v názvu (`mortality`).
* V tabulce `czechia_payroll_value_type` jsou **přehozené kódy**, které určují v tabulce `czechia_payroll` přiřazení jednotek k hodnotám – výsledkem je, že **lidská síla je evidována v Kč a mzdy v tisících zaměstnanců**, což je zjevná chyba.

## 3. Výzkumné otázky a odpovědi

### 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

Mzdy vykazují většinou rostoucí trend, nicméně v některých odvětvích dochází ke stagnaci nebo krátkodobému poklesu (např. v administrativních službách nebo zpracovatelském průmyslu).

### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za průměrnou mzdu?

Za průměrnou měsíční mzdu lze v průměru zakoupit několik stovek litrů mléka nebo kilogramů chleba. Přesná dostupnost se liší podle konkrétního roku a výše mzdy, ale trend ukazuje na zlepšující se dostupnost těchto základních potravin.

### 3. Která kategorie potravin zdražuje nejpomaleji?

Na základě výpočtu průměrného meziročního cenového růstu byla jako nejstabilnější položka identifikována potravina *cukr krystalový*, která dokonce v některých letech vykazuje mírný pokles cen. Jedná se tak o potravinu s nejpomalejším cenovým růstem v rámci celého sledovaného období.

### 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

Žádný takový rok nebyl identifikován. Data tedy hypotézu nepotvrzují.

### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin?

Z analýzy dat vyplývá, že existuje pozitivní korelace mezi růstem HDP a růstem průměrných mezd. Naproti tomu ceny potravin nevykazují jednoznačnou souvislost s výší HDP a jejich vývoj je ovlivněn spíše jinými faktory, jako je trh nebo sezónní vlivy.
