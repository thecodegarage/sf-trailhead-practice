@isTest
private class TestVerifyDate {

    @isTest static void TestCheckValidDates(){
        Date date1 = Date.newInstance(2023, 12,3);
        Date date2 = Date.newInstance(2023, 12,29);
        
        Date returnDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(returnDate, date2);
        
    }
    @isTest static void TestCheckInValidDates(){
        Date date1 = Date.newInstance(2023, 11,3);
        Date date2 = Date.newInstance(2023, 12,29);
        Date validReturnDate = Date.newInstance(2023, 11, 30);
        
        Date returnDate = VerifyDate.CheckDates(date1, date2);
        System.assertNotEquals(returnDate, date2);
        System.assertEquals(returnDate, validReturnDate);
        
    }
}
