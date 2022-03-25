# 多线程学习
# 线程池使用
# https://github.com/ruby-concurrency/concurrent-ruby/blob/master/docs-source/thread_pools.md

require 'concurrent/executor/fixed_thread_pool'

pool = Concurrent::fixed_thread_pool.new(2)
for i in 0..30
    pool.post do
        # do some parallel work
        puts " in thread: " + Thread.current.object_id.to_s
    end
end

pool.shutdown # 启动线程池的有序关闭
pool.wait_for_termination # 阻塞并等待池关闭完成


# 创建线程
t1 = Thread.new {
    puts " in thread: " + Thread.current.object_id.to_s
}
t1.join

# 线程异常处理

# 异常代码块
begin
    raise.. #抛出异常
rescue => exception
    
end

# 线程异常处理


