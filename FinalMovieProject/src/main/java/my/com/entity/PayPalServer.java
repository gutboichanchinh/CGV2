package my.com.entity;

import java.util.*;

import com.paypal.api.payments.*;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.base.rest.*;

public class PayPalServer {
	private static final String CLIENT_ID = "ASTVLR0QArgxargVzjNOrfN6sIbaSo6_Lvt0ohA4cF6HajpwEhpj07IUVEbqgc1FHl3ItvWal-ZdWYHL";
    private static final String CLIENT_SECRET = "EBMyEm9Hk19Z34TMZoRmhDtYMaiG6UY9yOZ11U3MKb59d6NflHoNBuGY5Iy04VQedc5ww8kGrmBxCtx-";
    private static final String MODE = "sandbox";
    
    public String authorizePayment(OrderDetail orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
        System.out.println(approvedPayment);
        return getApprovalLink(approvedPayment);
 
    }

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Tai")
                 .setLastName("nguyen")
                 .setEmail("tai832001@gmial.com");
        
        payer.setPayerInfo(payerInfo);
        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8082/FinalMovieProject/home");
        redirectUrls.setReturnUrl("http://localhost:8082/FinalMovieProject/reviewpayment");
        return redirectUrls;
    }
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException{
        APIContext aPIContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
        return Payment.get(aPIContext, paymentId);
    }
    public Payment executePayment(String paymentId,String payerId) throws PayPalRESTException{
        PaymentExecution execution = new PaymentExecution();
        execution.setPayerId(payerId);
        Payment payment = new Payment().setId(paymentId);
        APIContext aPIContext = new APIContext(CLIENT_ID,CLIENT_SECRET,MODE);
        return payment.execute(aPIContext, execution);
    }

    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
        Details details = new Details();
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(orderDetail.getFee());
        
        

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());
       
       
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        Item item = new Item();
        item.setCurrency("USD")
            .setName(orderDetail.getDescription())
            .setPrice(orderDetail.getSubtotal())
            .setTax(orderDetail.getFee())
            .setQuantity("1");
        
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        List<Transaction> listtransactions = new ArrayList<Transaction>();
        listtransactions.add(transaction);
        
        return listtransactions;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> linkses = approvedPayment.getLinks();
        String approvalLinks = null;
        for (Links linkse : linkses) {
            if(linkse.getRel().equalsIgnoreCase("approval_url")){
                approvalLinks = linkse.getHref();
            }
        }
        return approvalLinks;
    }
}
