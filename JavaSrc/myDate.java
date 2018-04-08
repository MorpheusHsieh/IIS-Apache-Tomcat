import java.util.*;

public class myDate
{
  // Constructor
  public myDate() {};

  // method
  public String SunDayCode()
  {
    String code = null;
    Date now = new Date();
    GregorianCalendar calendar = new GregorianCalendar();
    calendar.setTime(now);

    int yy = calendar.get(calendar.YEAR);
    int sunday = calendar.get(calendar.DAY_OF_YEAR);
    code = Integer.toString(yy) + Integer.toString(sunday);
    return code;
  }
}