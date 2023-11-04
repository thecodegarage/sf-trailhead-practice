public class StringArrayTest {

    public static List<String> generateStringArray(Integer stringCount){
        List<String> stringList = new List<string>();
        for (Integer x=0; x< stringCount; x++){
            String newString = 'Test ' + x;
            stringList.add(newString);
        }
        return stringList;
    }
}