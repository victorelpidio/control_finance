  
module PanelsHelper
  def months
    meses = %w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro]
    meses.each_with_index.map { |m, i| [m, i+1] }
  end

  def years
    (Date.today.year-5..Date.today.year+5).to_a.reverse
  end
end
