Enum 50135 "Order Satisfaction"
{
    Extensible = True;
    value(0; Bad)
    {
        Caption = 'Bad';
    }
    value(1; Moderate)
    {
        Caption = 'Moderate';
    }
    value(2; LovedIt)
    {
        Caption = 'Loved It';
    }
}












// Extensible = true on an Enum object explicitly allows other extensions or apps to add new values 
//to that enumeration list