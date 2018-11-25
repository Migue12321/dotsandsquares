class User
    @score = 0 
    @username = ""
    @userColor= ""
    
  def addUser(un,uc)
    @username = un
    @userColor= uc
    iniciarScore()
  end

  def getUsername()
    return @username
  end

  def iniciarScore()
    @score = 0
  end

  def getScore()
    return @score
  end 

  def addScore(n)
    suma = @score
    @score += 1 
  end

  def getColor()
    return @userColor
  end
  
end