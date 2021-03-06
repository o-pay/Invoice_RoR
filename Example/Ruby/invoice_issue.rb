require 'allpay_invoice'

class YOURCONTROLLER < ApplicationController
	# 開立發票
	def InvIssue
		## 參數值為[PLEASE MODIFY]者，請每次測試時給予獨特值
		inv_issue_dict = {
			"RelateNumber"=>"PLEASE MODIFY", # 請帶30碼uid, ex: f0a0d7e9fae1bb72bc93jg3495234
			"CustomerID"=>"", # 客戶代號，長度為20字元
			"CustomerIdentifier"=>"", # 統一編號，長度為10字元
			"CustomerName"=>"歐先生", # 客戶名稱，長度為20字元
			"CustomerAddr"=>"台北市南港區三重路19-2號6-2樓", # 客戶地址，長度為100字元
			"CustomerPhone"=>"0912345678", # 客戶電話，長度為20字元
			"CustomerEmail"=>"ohsirtest@allpay.com.test", # 客戶信箱，長度為80字元
			"ClearanceMark"=>"", # 通關方式，僅可帶入'1'、'2'、''
			"Print"=>"0", # 列印註記，僅可帶入'0'、'1'
			"Donation"=>"1", # 捐贈註記，僅可帶入'1'、'2'
			"LoveCode"=>"123456", # 愛心碼，長度為7字元
			"CarruerType"=>"", # 載具類別，僅可帶入'1'、'2'、'3'、''
			"CarruerNum"=>"", # 載具編號，當載具類別為'2'時，長度為16字元，當載具類別為'3'時，長度為7字元
			"TaxType"=>"1", # 課稅類別，僅可帶入'1'、'2'、'3'、'9'
			"SalesAmount"=>"1000", # 發票金額
			"InvoiceRemark"=>"", # 備註
			"ItemName"=>"洗衣精|洗髮乳", # 商品名稱，如果超過一樣商品時請以｜分隔
			"ItemCount"=>"5|5", # 商品數量，如果超過一樣商品時請以｜分隔
			"ItemWord"=>"瓶|罐", # 商品單位，如果超過一樣商品時請以｜分隔
			"ItemPrice"=>"100|100", # 商品價格，如果超過一樣商品時請以｜分隔
			"ItemTaxType"=>"", # 商品課稅別，如果超過一樣商品時請以｜分隔，如果TaxType為9請帶值，其餘為空
			"ItemAmount"=>"500|500", # 商品合計，如果超過一樣商品時請以｜分隔
			"ItemRemark"=>"test item|test item", # 商品備註，如果超過一樣商品時請以｜分隔
			"InvType"=>"07", # 字軌類別，、'07'一般稅額、'08'特種稅額
			"vat"=>"1" # 商品單價是否含稅，'1'為含稅價'、'2'為未稅價
		}
		
		inv_issue = AllpayInvoice::InvoiceClient.new # 將模組中的class實例化
		res = inv_issue.invoice_issue(inv_issue_dict) # 對class中的對應的method傳入位置參數
		
		render :text => res # 將回傳結果列印出來
	end