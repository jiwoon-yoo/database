Advise for Assignment – Execute 
select * <tablename>
example –> select * from ot.orders;
Query against each table shown in ER diagram above and scan data being displayed in 
output to understand the database before starting this assignment.
Execute following queries on this OT database and paste Queries and their output 
screenshots. Marks distribution is given with each query. Query should be correct in order 
to get marks for output screenshot.
Make sure to follow submission guidelines as -10% would be deducted for not following 
submission guidelines.
1. Create a view that selects customer details (Name & Address), Products ordered, Quantity 
ordered and total amount for all ‘Cancelled’ and ‘Shipped’ orders of 2016. (3 marks for Query + 
2 for output screenshot) [Hint;- total amount can be calculated using Quanity*unit_price]
2. Using set Operations, list all the Product names which were ordered so far but also available in 
stock in any warehouse as well. Make sure product names are unique. (Query – 3 Marks , 
Output sreenshot-2 marks)
3. Write a query to display number of customers who are served orders by each employee on each 
date. Make sure to display subtotals using all possible combinations using Grouping sets query. (3 
query + 2 Output screenshot)
4. Write a Query to print all warehouses and their locations from ‘Americas’ or ‘America’ Region 
sorted in descending order of warehouse name. (3 query + 2 Output screenshot)



과제에 대한 조언 - 실행
select * <테이블명>
예시 - select * from ot.orders;
위 ER 다이어그램에 표시된 각 테이블에 대해 쿼리를 실행하고 출력에서 표시된 데이터를 스캔하여 데이터베이스를 이해하기 위해 과제를 시작하기 전에 실행하십시오.
다음의 쿼리를 이 OT 데이터베이스에서 실행하고 쿼리와 그에 대한 출력 화면 캡처를 붙여넣으십시오. 각 쿼리에 대한 점수 배분이 제시되어 있으며, 출력 화면 캡처에 대한 점수를 받으려면 쿼리가 올바르게 작성되어야 합니다.
제출 지침을 따르는 것이 중요하며, 제출 지침을 따르지 않을 경우 10%의 점수가 감점됩니다.

2016년에 '취소됨' 및 '배송됨' 주문에 대한 모든 고객 세부 정보 (이름 및 주소), 주문한 제품, 주문 수량 및 총액을 선택하는 뷰를 생성하십시오. (쿼리 3점 + 출력 화면 캡처 2점) [힌트: 총액은 수량*단가로 계산할 수 있습니다]
집합 연산을 사용하여 지금까지 주문된 제품 중 어떤 창고에서도 재고로 사용 가능한 제품 이름을 나열하십시오. 제품 이름은 고유해야 합니다. (쿼리 3점, 출력 화면 캡처 2점)
각 직원이 각 날짜에 주문을 처리한 고객 수를 표시하기 위한 쿼리를 작성하십시오. Grouping sets 쿼리를 사용하여 가능한 모든 조합에 대한 소계를 표시하도록 하십시오. (쿼리 3개 + 출력 화면 캡처 2점)
'아메리카' 또는 '미국' 지역에서 'Americas' 지역에 속하는 모든 창고와 위치를 차례로 정렬하여 출력하는 쿼리를 작성하십시오. (쿼리 3개 + 출력 화면 캡처 2점)
