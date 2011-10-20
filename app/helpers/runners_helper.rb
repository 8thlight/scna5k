module RunnersHelper

  def sort_by_time runners
    runners_ary = runners.collect {|runner| {runner.id => (runner.minutes.to_s + ":" + runner.seconds.to_s)}}
    runners_hash = runners_ary.inject {|all, h| all.merge(h) } || {}
    sorted_runners_ary = runners_hash.sort_by {|k,v| v }.collect {|x| x.first}
    sorted_runners = []
    sorted_runners_ary.each do |id|
      sorted_runners << Runner.find(id)
    end
    return sorted_runners
  end

end
