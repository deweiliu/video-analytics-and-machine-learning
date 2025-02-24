function Iout = myconvolution(input_image, mask)
    [image_rows, image_columns] = size(input_image);

    % M is the number of rows of the mask
    % N is the number of columns of the mask
    [M, N] = size(mask);
    convolved_rows = image_rows - M + 1;
    convolved_columns = image_columns - N + 1;

    convolved_image = zeros(convolved_rows, convolved_columns, class(input_image));
    % k and l are the indices of the pixel in the convolved image
    for k = 1:convolved_rows

        for l = 1:convolved_columns
            % the rows and columns needed to perform the element-wise
            % multiplication
            row_indices = k:k + M - 1;
            column_indices = l:l + N - 1;

            image_area = double(input_image(row_indices, column_indices));

            pixel = element_wise_mulitiplication(image_area, mask);
            convolved_image(k, l) = pixel;
        end

    end

    Iout = uint8(convolved_image);

end

function pixel = element_wise_mulitiplication(matrix1, matrix2)
    new_matrix = matrix1 .* matrix2;
    pixel = sum(sum(new_matrix));

end
