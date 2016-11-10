class DiffArray
  MAX = 1000.freeze

  def run
    base_array, leftover_array = initialize_arrays
    diff(base_array, leftover_array)
  end

  private

  # 課題用の初期化した配列を取得
  def initialize_arrays
    base_array = (1..MAX).to_a.shuffle
    leftover_array = base_array.dup
    leftover_array.delete_at(rand(1..MAX) - 1)

    [base_array, leftover_array]
  end

  # 配列間の差を抽出 二分探索 O(log2 n)
  def diff(base_array, leftover_array)
    left = 0
    right = base_array.size - 1

    while left < right do
      target = (left + right) / 2
      if base_array[target] == leftover_array[target]
        left = target + 1
      else
        right = target
      end
    end

    base_array[left]
  end

  # おまけ
=begin
  # 二分探索2 O(log2 n)
  def diff_another(base_array, leftover_array)
    index = leftover_array.size / 2
    distance = index / 2
    loop do
      return base_array[index + 1] if (base_array[index] == leftover_array[index] and base_array[index + 1] != leftover_array[index + 1])

      index = (base_array[index] == leftover_array[index] ? index + distance : index - distance)
      distance = distance / 2 unless distance <= 1
    end
  end

  # 配列の要素数が最大でも10程度と分かっていればこれもありか diffの4〜5倍程度遅い
  def diff_simple(base_array, leftover_array)
    (base_array - leftover_array)[0]
  end

  # diff_simpleと同様
  def diff_inject(base_array, leftover_array)
    [base_array, leftover_array].inject(&:-)[0]
  end

  # 線形探索 O(n) 遅い
  def diff_poor(base_array, leftover_array)
    (1..base_array.size).each { |i| return base_array[i] if base_array[i] != leftover_array[i] }
  end

  # 再帰
  def diff_recursive(base_array, leftover_array)
    left = 0
    right = base_array.size - 1
    target = right / 2

    diff_recursive_core(base_array, leftover_array, left, right, target)
  end

  def diff_recursive_core(base_array, leftover_array, left, right, target)
    return base_array[left] unless left < right

    if base_array[target] == leftover_array[target]
      left = target + 1
    else
      right = target
    end
    target = (left + right) / 2
    diff_recursive_core(base_array, leftover_array, left, right, target)
  end
=end
end