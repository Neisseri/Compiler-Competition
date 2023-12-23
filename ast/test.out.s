Program
  int @ifElseIf()
    {
      int @a#2
      Assign@a#2 = 5
      int @b#2
      Assign@b#2 = 10
      Return @a#2
    }
  int @main()
    {
      Call @putint(Call @ifElseIf())
      Return 0
    }
End of Program
